//
//  치킨 배달.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/08.
//

import Foundation
//5 3
//0 0 1 0 0
//0 0 2 0 1
//0 1 2 0 0
//0 0 1 0 0
//0 0 0 0 2
func solution15686() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var graph: [[Int]] = []
    var hPoint: [(Int, Int)] = []
    var cPoint: [(Int, Int)] = []
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph.append(input)
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 {
                hPoint.append((i + 1, j + 1))
            } else if graph[i][j] == 2 {
                cPoint.append((i + 1, j + 1))
            }
        }
    }
    
    var visited = Array(repeating: false, count: cPoint.count)
    var results: [[(Int, Int)]] = []
    var temp: [(Int, Int)] = []
    
    func combination(m: Int, start: Int) {
        if m == 0 {
            results.append(temp)
            return
        }
        
        for i in start..<cPoint.count {
            if visited[i] {
                continue
            }

            visited[i] = true
            temp.append(cPoint[i])
            combination(m: m - 1, start: i + 1)
            temp.removeLast()
            visited[i] = false
        }
    }
    
    combination(m: m, start: 0)
    
    var answer = 987654321
    for result in results {
        var sum = 0
        for h in hPoint {
            var temp = 987654321
            for r in result {
                let distance = abs(r.0 - h.0) + abs(r.1 - h.1)
                temp = min(temp, distance)
            }
            sum += temp
        }
        answer = min(answer, sum)
    }
    
    print(answer)
}
