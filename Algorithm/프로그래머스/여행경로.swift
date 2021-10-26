//
//  여행경로.swift
//  Algorithm
//  - DFS, BFS
//  Created by 전소영 on 2021/10/26.
//

import Foundation

func findCourse(_ tickets: inout [[String]], _ visited: inout [Bool], _ destination: String, _ course: [String]) -> [String] {
    if course.count == tickets.count + 1 {
        return course
    }
    
    for (index, ticket) in tickets.enumerated() {
        if ticket[0] == destination && visited[index] == false {
            visited[index] = true
            var newCourse = course
            newCourse.append(ticket[1])
            let result = findCourse(&tickets, &visited, ticket[1], newCourse)
            
            if !result.isEmpty {
                return result
            }
        }
    }
    
    return []
}

func solution(_ tickets: [[String]]) -> [String] {
    var tickets = tickets.sorted(by: { $0[1] < $1[1] })
    var visited = Array(repeating: false, count: tickets.count)
 
    return findCourse(&tickets, &visited, "ICN", ["ICN"])
}
