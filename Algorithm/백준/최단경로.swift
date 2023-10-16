//
//  최단경로.swift
//  Algorithm
//
//  Created by 전소영 on 2023/10/15.
//

import Foundation
//5 6
//1
//5 1 1
//1 2 2
//1 3 3
//2 3 4
//2 4 5
//3 4 6

//0
//2
//3
//7
//INF
func solution1753() {
    let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
    let v = ve[0]
    let e = ve[1]
    let start = Int(readLine()!)!
    var graph: [[(Int, Int)]] = Array(repeating: [], count: v + 1)

    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append((input[1], input[2]))
    }
    
    struct Heap {
        var nodes: [(Int, Int)] = []
        
        func isEmpty() -> Bool {
            return nodes.isEmpty
        }
        
        mutating func insert(_ node: (Int, Int)) {
            nodes.append(node)
            var currentIndex = nodes.count - 1
            
            if currentIndex > 0, nodes[currentIndex].1 < nodes[currentIndex / 2].1 {
                nodes.swapAt(currentIndex, currentIndex / 2)
                currentIndex = currentIndex / 2
            }
        }
        
        mutating func delete() -> (Int, Int) {
            let node = nodes[0]
            var currentIndex = 0
            nodes.swapAt(0, nodes.count - 1)
            nodes.removeLast()
            
            while currentIndex * 2 < nodes.count {
                let leftChildIndex = currentIndex * 2
                let rightChildIndex = currentIndex * 2 + 1
                var minimumChildIndex = leftChildIndex
                
                if rightChildIndex * 2 < nodes.count, nodes[rightChildIndex].1 < nodes[leftChildIndex].1 {
                    minimumChildIndex = rightChildIndex
                }
                
                if nodes[minimumChildIndex].1 < nodes[currentIndex].1 {
                    nodes.swapAt(minimumChildIndex, currentIndex)
                    currentIndex = minimumChildIndex
                } else {
                    break
                }
            }
            
            return node
        }
    }
    
    func dijkstra(_ start: Int) -> [Int] {
        var visited = Array(repeating: Int.max, count: v + 1)
        var heap = Heap()
        heap.insert((start, 0))
        visited[start] = 0
                  
        while !heap.isEmpty() {
            let (node, time) = heap.delete()
            
            if visited[node] < time {
                continue
            }
            
            for i in graph[node] {
                if visited[i.0] > time + i.1 {
                    visited[i.0] = time + i.1
                    heap.insert((i.0, time + i.1))
                }
            }
        }
        
        return visited
    }

    let result = dijkstra(start)
    
    for i in 1...v {
        print(result[i] == Int.max ? "INF" : result[i])
    }
}
