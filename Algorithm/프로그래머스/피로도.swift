//
//  피로도.swift
//  Algorithm
//  - 백트래킹
//  Created by 전소영 on 2022/04/11.
//

import Foundation

func dungeons(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var answer: Int = 0
    dfs(k: k, dungeons: dungeons, result: 0, answer: &answer)
    return answer
}

//k    dungeons                       result
//80    [[80,20], [50,40], [30,10]]    3
func dfs(k: Int, dungeons: [[Int]], result: Int, answer: inout Int) {
    answer = max(answer, result)
    
    for (i, dungeon) in dungeons.enumerated() {
        var newDungeons = dungeons
        if k >= dungeon[0] && k >= dungeon[1] {
            let newK = k - dungeon[1]
            newDungeons.remove(at: i)
            dfs(k: newK, dungeons: newDungeons, result: result + 1, answer: &answer)
        }
    }
}
