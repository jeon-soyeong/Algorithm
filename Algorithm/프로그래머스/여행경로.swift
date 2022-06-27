//
//  여행경로.swift
//  Algorithm
//  - DFS, BFS
//  Created by 전소영 on 2021/10/26.
//

import Foundation

//tickets                                             return
//[["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]    ["ICN", "JFK", "HND", "IAD"]
//[["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
//["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
//["ICN", "A"], ["ICN", "B"], ["B", "ICN"]]

func solution(_ tickets: [[String]]) -> [String] {
    //  ["JFK", "HND"], ["HND", "IAD"], ["ICN", "JFK"]
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var visited = Array(repeating: false, count: tickets.count)
    var result: [String] = []
    
    func dfs(startingPoint: String) {
        if result.count == tickets.count {
            result.append(startingPoint)
            return
        }
        
        for i in 0..<tickets.count {
            if tickets[i][0] == startingPoint, !visited[i] {
                visited[i] = true
                result.append(startingPoint)
                dfs(startingPoint: tickets[i][1])
                if result.count == tickets.count + 1 {
                    return
                }
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    dfs(startingPoint: "ICN")
    return result
}
