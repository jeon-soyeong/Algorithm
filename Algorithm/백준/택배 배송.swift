//
//  택배 배송.swift
//  Algorithm
//
//  Created by 전소영 on 2023/10/18.
//

import Foundation

//6 8
//4 5 3
//2 4 0
//4 1 4
//2 1 1
//5 6 1
//3 6 2
//3 2 6
//3 4 4
func solution5972() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append((input[1], input[2]))
        graph[input[1]].append((input[0], input[2]))
    }
    
    struct Heap {
        var nodes: [(Int, Int)] = []
        
        func isEmpty() -> Bool {
            return nodes.isEmpty
        }
        
        mutating func insert(_ node: (Int, Int)) {
            var index = nodes.count
            nodes.append(node)
            
            while index > 0, nodes[index] < nodes[(index - 1) / 2] {
                nodes.swapAt(index, (index - 1) / 2)
                index = (index - 1) / 2
            }
        }
        
        mutating func delete() -> (Int, Int) {
            let node = nodes[0]
            var index = nodes.count - 1
            nodes.swapAt(0, index)
            nodes.removeLast()
            
            while nodes.count * 2 < nodes.count {
                let leftIndex = index * 2
                let rightIndex = index * 2 + 1
                var minimumIndex = leftIndex
                
                if rightIndex * 2 < nodes.count, nodes[rightIndex].1 < nodes[leftIndex].1 {
                    minimumIndex = rightIndex
                }
                
                if index > 0, nodes[minimumIndex].1 < nodes[index].1 {
                    nodes.swapAt(minimumIndex, index)
                    index = minimumIndex
                } else {
                    break
                }
            }
            
            return node
        }
    }

    func dijkstra(_ start: Int) -> [Int] {
        var visited = Array(repeating: Int.max, count: n + 1)
        var heap = Heap()
        heap.insert((start, 0))
        visited[start] = 0

        while !heap.isEmpty() {
            let (node, time) = heap.delete()
            
            if visited[node] < time {
                continue
            }

            for i in graph[node] {
                if visited[i.0] > i.1 + time {
                    visited[i.0] = i.1 + time
                    heap.insert((i.0, i.1 + time))
                }
            }
        }
        
        return visited
    }
    
    let result = dijkstra(1)
    print(result.last!)
}
