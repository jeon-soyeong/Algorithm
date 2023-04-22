//
//  광물 캐기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/21.
//

import Foundation

// 다이아, 철, 돌 곡갱이
// [1, 3, 2]    ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]    12
// 다이아몬드 곡괭이로 앞에 다섯 광물을 캐고 철 곡괭이로 남은 다이아몬드, 철, 돌을 1개씩 캐면 12(1 + 1 + 1 + 1+ 1 + 5 + 1 + 1)의 피로도로 캘 수 있으며 이때가 최소값입니다.

// [0, 1, 1]    ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"]    50
// 철 곡괭이로 다이아몬드 5개를 캐고 돌 곡괭이고 철 5개를 캐면 50의 피로도로 캘 수 있으며, 이때가 최소값입니다.
func solution172927(_ picks:[Int], _ minerals:[String]) -> Int {
    var answer = Int.max
    let fatigabilityArray = [[1, 1, 1], [5, 1, 1], [25, 5, 1]]
    let mineralDictionary = ["diamond": 0, "iron": 1, "stone": 2]
    
    func dfs(_ index: Int, _ diamondCount: Int, _ ironCount: Int, _ stoneCount: Int, _ fatigability: Int) {
        if index == minerals.count || (diamondCount == 0 && ironCount == 0 && stoneCount == 0) {
            answer = min(answer, fatigability)
            return
        }
        
        var diamondFatigability = 0
        var ironFatigability = 0
        var stoneFatigability = 0
        
        for i in stride(from: index, to: min(index + 5, minerals.count), by: 1) {
            if let mineral = mineralDictionary[minerals[i]] {
                diamondFatigability += fatigabilityArray[0][mineral]
                ironFatigability += fatigabilityArray[1][mineral]
                stoneFatigability += fatigabilityArray[2][mineral]
            }
        }
        
        if diamondCount > 0 {
            dfs(index + 5, diamondCount - 1, ironCount, stoneCount, fatigability + diamondFatigability)
        }
        
        if ironCount > 0 {
            dfs(index + 5, diamondCount, ironCount - 1, stoneCount, fatigability + ironFatigability)
        }
        
        if stoneCount > 0 {
            dfs(index + 5, diamondCount, ironCount, stoneCount - 1, fatigability + stoneFatigability)
        }
    }
    
    dfs(0, picks[0], picks[1], picks[2], 0)
    
    return answer
}
