//
//  양과 늑대.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/15.
//

import Foundation
// info                            edges                                                                    result
// [0,0,1,1,1,0,1,0,1,0,1,1]    [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]    5
// [0,1,0,1,1,0,1,0,0,1,0]        [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]            5
func solution92343(_ info: [Int], _ edges: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: info.count)
    var answer = 0
    visited[0] = true
    
    func dfs(sheep: Int, wolf: Int) {
        if sheep > wolf {
            answer = max(answer, sheep)
        } else {
            return
        }
        
        for edge in edges {
            let parent = edge[0]
            let child = edge[1]
            if visited[parent], !visited[child] {
                visited[child] = true
                if info[child] == 0 { // 양이면
                    dfs(sheep: sheep + 1, wolf: wolf)
                } else { // 늑대면
                    dfs(sheep: sheep, wolf: wolf + 1)
                }
                visited[child] = false
            }
        }
    }
    
    dfs(sheep: 1, wolf: 0)
    return answer
}
