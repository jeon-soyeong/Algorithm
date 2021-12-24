//
//  후보키.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/23.
//

import Foundation

var combinationArray: [[Int]] = []

func candidateKey(_ relation: [[String]]) -> Int {
    var keys: Set<[Int]> = []
    let rowCount = relation.count
    var combinationList: [[Int]] = []
    var relationArray: [Int] = []
    
    for i in 0..<relation[0].count {
        relationArray.append(i)
    }
    
    combinationList = createCombinations(relationArray, index: 0, temp: [])
    
    for combination in combinationList {
        guard isUnique(combination: combination, keys: keys) else {
            continue
        }
        
        if numberOfRowsSet(of: combination, in: relation) == rowCount {
            keys.insert(combination)
        }
    }
    
    return keys.count
}

func createCombinations(_ array: [Int], index: Int, temp: [Int]) -> [[Int]] {
    combinationArray.append(temp)

    for i in index..<array.count {
        createCombinations(array, index: i + 1, temp: temp + [array[i]])
    }
   
    return combinationArray.filter { !$0.isEmpty }.sorted { $0.count < $1.count }
}

func numberOfRowsSet(of columns: [Int], in relation: [[String]]) -> Int {
    var rows = [String](repeating: "", count: relation.count)
    
    for col in columns {
        for (idx, row) in relation.enumerated() {
            rows[idx] += row[col]
        }
    }
    
    return Set(rows).count
}

func isUnique(combination: [Int], keys: Set<[Int]>) -> Bool {
    for key in keys {
        var unique = false
        
        for k in key {
            if !combination.contains(k) {
                unique = true
                break
            }
        }
        
        if !unique {
            return false
        }
    }
    
    return true
}
