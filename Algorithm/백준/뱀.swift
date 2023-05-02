//
//  뱀.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/02.
//

import Foundation

func solution3190() {
    var answer = 0
    
    let n = Int(readLine()!)!
    var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
    let k = Int(readLine()!)!
    
    for _ in 0..<k {
        let point = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        graph[point[0]][point[1]] = 2
    }
    
    let l = Int(readLine()!)!
    var direction: [Int: Int] = [:]
    
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    for _ in 0..<l {
        let data = readLine()!.split(separator: " ")
        direction[Int(data[0])!] = data[1] == "D" ? 1 : 3
    }
    
    var x = 0
    var y = 0
    var d = 0
    var snake = [(0, 0)]
    graph[0][0] = 1
    
    func isValidRange(_ x: Int, _ y: Int) -> Bool {
        return 0..<n ~= x && 0..<n ~= y
    }
    
    while true {
        answer += 1
        x = x + dx[d]
        y = y + dy[d]
        
        if !isValidRange(x, y) || graph[x][y] == 1 {
            break
        }
        
        if graph[x][y] == 0 {
            snake.append((x, y))
            graph[x][y] = 1
            let tail = snake.removeFirst()
            graph[tail.0][tail.1] = 0
        } else if graph[x][y] == 2 {
            snake.append((x, y))
            graph[x][y] = 1
        }
        
        for (key, value) in direction {
            if key == answer {
                d = (d + value) % 4
            }
        }
    }
    
    print(answer)
}
