//
//  순위검색.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/16.
//

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {
    var dictionary: [String: [Int]] = [:]
    var answer: [Int] = []
    
    func combination(_ array: [String], _ currentIndex: Int, _ score: Int) {
        if currentIndex == array.count {
            let result = array.joined()
            
            if dictionary[result] != nil {
                dictionary[result]!.append(score)
            } else {
                dictionary[result] = [score]
            }
        } else {
            var temp = array
            combination(temp, currentIndex + 1, score)
            temp[currentIndex] = "-"
            combination(temp, currentIndex + 1, score)
        }
        
        return
    }
    
    func lowerbound(_ array: [Int], _ score: Int) -> Int {
        var low = 0
        var high = array.count
        
        while low < high {
            let mid = (low + high) / 2
            if score <= array[mid] {
                high = mid
            } else {
                low = mid + 1
            }
        }
        
        return array.count - low
    }
    
    for i in info {
        var components = i.components(separatedBy: " ")
        let score = Int(components[4])!
        components.removeLast()
        combination(components, 0, score)
    }
    
    for (query, scores) in dictionary {
        let sortedScores = scores.sorted(by: <)
        dictionary[query] = sortedScores
    }
    
    for q in query {
        var components = q.components(separatedBy: " ").filter { $0 != "and" }
        let score = Int(components[4])!
        components.removeLast()
        let key = components.joined()
        
        if dictionary[key] == nil {
            answer.append(0)
        } else {
            answer.append(lowerbound(dictionary[key]!, score))
        }
    }
    
    return answer
}
