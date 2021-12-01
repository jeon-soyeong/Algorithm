//
//  메뉴 리뉴얼.swift
//  Algorithm
//
//  Created by 전소영 on 2021/11/30.
//

import Foundation

func generateCombination(order: [Character], combinations: inout [String], combinationString: inout String, stringSize: Int, index: Int) {
    if combinationString.count == stringSize {
        combinations.append(combinationString)
        return
    }
    
    for index in index..<order.count {
        combinationString.append(order[index])
        generateCombination(order: order, combinations: &combinations, combinationString: &combinationString, stringSize: stringSize, index: index + 1)
        combinationString.removeLast()
    }
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    let sortedOrders = orders.map { $0.sorted() }
    var answer: Set<String> = []
    var orderCombinations: [String] = []
    
    for order in sortedOrders {
        for i in course {
            var combinations: [String] = []
            var initialString: String = ""
            generateCombination(order: Array(order), combinations: &combinations, combinationString: &initialString, stringSize: i, index: 0)
            orderCombinations += combinations
        }
    }
    
    for number in course {
        var combinationCounts: [String: Int] = [:]
        let courseCombination = orderCombinations.filter { $0.count == number }
        
        for combination in courseCombination {
            combinationCounts[combination] = courseCombination.filter { $0 == combination }.count
        }
        
        let maxCount = combinationCounts.values.max()
        if maxCount == 1 { continue }
        
        combinationCounts.keys.filter { combinationCounts[$0] == maxCount }.forEach {
            answer.insert($0)
        }
    }
    
    return Array(answer.sorted())
}
