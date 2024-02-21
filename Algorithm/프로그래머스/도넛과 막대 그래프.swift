//
//  도넛과 막대 그래프.swift
//  Algorithm
//
//  Created by 전소영 on 2024/02/20.
//

import Foundation
//edges                                                                                                                                result
//[[2, 3], [4, 3], [1, 1], [2, 1]]                                                                                                     [2, 1, 1, 0]
//[[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]    [4, 0, 1, 2]
func solution(_ edges: [[Int]]) -> [Int] {
    var answer = [0, 0, 0, 0]
    var graph: [Int: [Int]] = [:]
    
    for edge in edges {
        let outV = edge[0]
        let inV = edge[1]
        
        if graph[outV] == nil {
            graph[outV] = [0, 0]
        }
        
        if graph[inV] == nil {
            graph[inV] = [0, 0]
        }
        
        // out, in 순
        graph[outV]![0] += 1
        graph[inV]![1] += 1
    }
    
    for (index, value) in graph {
        if value[0] >= 2, value[1] == 0 { // 생성한 정점: out 2개 이상만 존재
            answer[0] = index
        } else if value[0] == 0, value[1] > 0 { // 막대: in
            answer[2] += 1
        } else if value[0] >= 2, value[1] >= 2 { // 8자: 가운데 정점이 2개 이상의 in과 2개 이상의 out 존재
            answer[3] += 1
        }
    }
    // 도넛: 생성점 out 선에서 2종류 그래프 뺀 갯수
    answer[1] = graph[answer[0]]![0] - answer[2] - answer[3]

    return answer
}
