//
//  뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/07.
//

import Foundation

func createCombination(string: [Character], combinations: inout [String], combinationString: inout String) -> [String] {
    let stringFormat = "^[A-Za-z]*$"
    
    for index in 0..<string.count - 1 {
        combinationString = ""
        combinationString.append(string[index].uppercased())
        combinationString.append(string[index + 1].uppercased())
        if let _ = combinationString.range(of: stringFormat, options: .regularExpression) {
            combinations.append(combinationString)
        }
    }
    
    return combinations
}

func solution(_ str1: String, _ str2: String) -> Int {
    var combinations: [String] = []
    var initialString: String = ""
    
    let str1Combination = createCombination(string: Array(str1), combinations: &combinations, combinationString: &initialString)
    
    combinations = []
    initialString = ""
    let str2Combination = createCombination(string: Array(str2), combinations: &combinations, combinationString: &initialString)
   
    if str1Combination.isEmpty && str2Combination.isEmpty { return 65536 }
    
    let intersectionCount = getIntersectionCount(base: str1Combination, other: str2Combination)
    let unionCount = getUnionCount(base: str1Combination, other: str2Combination)
    let answer = Int(floor((Double(intersectionCount) / Double(unionCount)) * 65536))

    return answer
}

func getUnionCount(base: [String], other: [String]) -> Int {
    let intersectionCount = getIntersectionCount(base: base, other: other)
    
    return base.count + other.count - intersectionCount
}

func getIntersectionCount(base: [String], other: [String]) -> Int {
    var result = 0
    var dictionary: [String: Int] = [:]
    
    other.forEach {
        if dictionary[$0] != nil {
            dictionary[$0]! += 1
        } else {
            dictionary[$0] = 1
        }
    }
    
    base.forEach {
        if let v = dictionary[$0], v >= 1 {
            result += 1
            dictionary[$0]! -= 1
        }
    }
    
    return result
}
