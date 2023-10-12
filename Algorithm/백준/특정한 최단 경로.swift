//
//  특정한 최단 경로.swift
//  Algorithm
//
//  Created by 전소영 on 2023/10/11.
//

import Foundation

//4 6
//1 2 3
//2 3 3
//3 4 1
//1 3 5
//2 4 5
//1 4 4
//2 3
func solution1504() {
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
        var visited = Array(repeating: 999999999, count: n + 1)
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
    
    let ne = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = ne[0]
    let e = ne[1]
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append((input[1], input[2]))
        graph[input[1]].append((input[0], input[2]))
    }
    
    let vNode = readLine()!.split(separator: " ").map { Int(String($0))! }
    let vNode1 = vNode[0]
    let vNode2 = vNode[1]
    
    let start = dijkstra(1) // !!
    let v1 = dijkstra(vNode1) // 2
    let v2 = dijkstra(vNode2) // 3
    
    let answer1 = start[vNode1] + v1[vNode2] + v2[n]
    let answer2 = start[vNode2] + v2[vNode1] + v1[n]
    
    let answer = min(answer1, answer2)
    print(answer >= 999999999 ? -1 : answer)
}


//struct Heap<T> {
//    var nodes: [T] = []
//    let sort: (T, T) -> Bool
//
//    init(sort: @escaping (T, T) -> Bool) {
//        self.sort = sort
//    }
//
//    func isEmpty() -> Bool {
//        return nodes.isEmpty
//    }
//
//    mutating func insert(_ node: T) {
//        var currentIndex = nodes.count
//        nodes.append(node)
//
//        if currentIndex > 0, sort(nodes[currentIndex], nodes[(currentIndex - 1) / 2]) {
//            nodes.swapAt(currentIndex, (currentIndex - 1) / 2)
//            currentIndex = (currentIndex - 1) / 2
//        }
//    }
//
//    mutating func delete() -> T {
//        if nodes.count == 1 {
//            return nodes.removeLast()
//        }
//
//        let node = nodes[0]
//        var currentIndex = 0
//        nodes.swapAt(0, nodes.count - 1)
//        nodes.removeLast()
//
//        while currentIndex < nodes.count {
//            let leftChildIndex = currentIndex * 2
//            let rightChildIndex = currentIndex * 2 + 1
//
//            let children = [leftChildIndex, rightChildIndex]
//                .filter { $0 < nodes.count && sort(nodes[$0], nodes[currentIndex]) }
//                .sorted { sort(nodes[$0], nodes[$1]) }
//
//            if children.isEmpty {
//                break
//            }
//
//            nodes.swapAt(currentIndex, children[0])
//            currentIndex = children[0]
//        }
//
//        return node
//    }
//}
//
//func dijkstra(_ start: Int) -> [Int] {
//    var visited = Array(repeating: 999999999, count: n + 1)
//    visited[start] = 0
//
//    var heap = Heap<(Int, Int)>(sort: { $0.1 < $1.1 })
//    heap.insert((start, 0))
//
//    while !heap.isEmpty() {
//        let (node, time) = heap.delete()
//
//        if visited[node] < time {
//            continue
//        }
//
//        for i in graph[node] {
//            if visited[i.0] > time + i.1 {
//                visited[i.0] = time + i.1
//                heap.insert((i.0, time + i.1))
//            }
//        }
//    }
//
//    return visited
//}
//
//let ne = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = ne[0]
//let e = ne[1]
//var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
//
//for _ in 0..<e {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    graph[input[0]].append((input[1], input[2]))
//    graph[input[1]].append((input[0], input[2]))
//}
//
//let vNode = readLine()!.split(separator: " ").map { Int(String($0))! }
//let vNode1 = vNode[0]
//let vNode2 = vNode[1]
//
//let start = dijkstra(1)
//let v1 = dijkstra(vNode1) // 2
//let v2 = dijkstra(vNode2) // 3
//
//let answer1 = start[vNode1] + v1[vNode2] + v2[n]
//let answer2 = start[vNode2] + v2[vNode1] + v1[n]
//
//let answer = min(answer1, answer2)
//print(answer >= 999999999 ? -1 : answer)
