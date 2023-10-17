//
//  백도어.swift
//  Algorithm
//
//  Created by 전소영 on 2023/10/16.
//

import Foundation

//5 7
//0 0 0 1 1 (마지막 제외하고는 0만 가능함)
//0 1 7
//0 2 2
//1 2 4
//1 3 3
//1 4 6
//2 3 2
//3 4 1
//
//12 0-2-1-4를 지나는 시간인 12(2+4+6)이 최소 시간이 된다.
func solution17396() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var bool = readLine()!.split(separator: " ").map { Int(String($0))! }
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n)
    bool[n - 1] = 0
    
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
            var currentIndex = nodes.count
            nodes.append(node)

            while currentIndex > 0, nodes[currentIndex].1 < nodes[(currentIndex - 1) / 2].1 {
                nodes.swapAt(currentIndex, (currentIndex - 1) / 2)
                currentIndex = (currentIndex - 1) / 2
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
        var visited = Array(repeating: Int.max, count: n)
        var heap = Heap()
        heap.insert((start, 0))
        visited[start] = 0
        
        while !heap.isEmpty() {
            let (node, time) = heap.delete()
            
            if visited[node] < time {
                continue
            }
            
            for i in graph[node] {
                if visited[i.0] > time + i.1, bool[i.0] == 0 {
                    visited[i.0] = time + i.1
                    heap.insert((i.0, time + i.1))
                }
            }
        }
        
        return visited
    }
    
    let result = dijkstra(0)
    print(result[n - 1] == Int.max ? -1 : result[n - 1])
}
