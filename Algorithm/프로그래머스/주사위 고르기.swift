//
//  주사위 고르기.swift
//  Algorithm
//
//  Created by 전소영 on 2024/02/13.
//

import Foundation
//dice                                                                                                    result
//[[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]                        [1, 4]
//[[1, 2, 3, 4, 5, 6], [2, 2, 4, 4, 6, 6]]                                                                [2]
//[[40, 41, 42, 43, 44, 45], [43, 43, 42, 42, 41, 41], [1, 1, 80, 80, 80, 80], [70, 70, 1, 1, 70, 70]]    [1, 3]
func solution258709(_ dice: [[Int]]) -> [Int] {
    var answer: [Int] = []
    var diceCombinations: [[Int]] = []
    var diceASums: [Int] = []
    var diceBSums: [Int] = []
    var maxWin = 0
    
    combination(Array(1...dice.count), dice.count / 2, [], 0)
    
    for diceA in diceCombinations {
        let diceB = Array(1...dice.count).filter { !diceA.contains($0) }
        
        diceASums = getSum(diceA)
        diceBSums = getSum(diceB).sorted()
        
        var win = 0
        
        for diceASum in diceASums {
            var start = 0, end = diceBSums.count
            
            while start < end {
                var mid = (start + end) / 2
                
                if diceBSums[mid] < diceASum {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            
            win += end
        }
        
        if maxWin <= win {
            maxWin = win
            answer = diceA
        }
    }
    
    return answer
    
    func getSum(_ d: [Int]) -> [Int] {
        var sums: [Int] = []
        
        func dfs(_ index: Int, _ sum: Int) {
            if index >= d.count {
                sums.append(sum)
                return
            }
            
            for i in 0..<6 {
                dfs(index + 1, sum + dice[d[index] - 1][i])
            }
        }
        
        dfs(0, 0)
        return sums
    }
    
    func combination(_ array: [Int], _ target: Int, _ temp: [Int], _ index: Int) {
        if temp.count == target {
            diceCombinations.append(temp)
            return
        }
        
        for i in index..<array.count {
            combination(array, target, temp + [array[i]], i + 1)
        }
    }
}
