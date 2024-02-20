//
//  가장 많이 받은 선물.swift
//  Algorithm
//
//  Created by 전소영 on 2024/02/20.
//

import Foundation
//friends                              gifts                                                                                                        result
//["muzi", "ryan", "frodo", "neo"]    ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]    2
func solution(_ friends: [String], _ gifts: [String]) -> Int {
    var friendsDictionary: [String: Int] = [:]
    var graph = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var giftDegree: [Int] = []
    var answer = Array(repeating: 0, count: friends.count)
    
    for i in 0..<friends.count {
        friendsDictionary[friends[i]] = i
    }
    
    for gift in gifts {
        let g = gift.split(separator: " ").map { String($0) }
        let give = friendsDictionary[g[0]]!
        let take = friendsDictionary[g[1]]!
        
        graph[give][take] += 1
    }
    
    for i in 0..<graph.count {
        var giveCount = 0
        var takeCount = 0
        for j in 0..<graph.count {
            giveCount += graph[i][j]
            takeCount += graph[j][i]
        }
        giftDegree.append((giveCount - takeCount))
    }
    
    //두 사람이 선물을 주고 받았다면, 더 많은 선물을 준 사람이 선물을 하나 받음
    for i in 0..<graph.count {
        for j in 0..<graph.count {
            if graph[i][j] > graph[j][i] {
                answer[i] += 1
             // 두 사람이 선물을 주고받지 X or 주고받은 수가 ==, 선물 지수가 큰사람이 선물을 하나 받음(선물지수도 같다면 선물 주고 받지 X)
            } else if graph[i][j] == graph[j][i] || (graph[i][j] == 0 && graph[j][i] == 0) {
                if giftDegree[i] > giftDegree[j] {
                    answer[i] += 1
                }
            }
        }
    }
    
    return answer.max()!
}
