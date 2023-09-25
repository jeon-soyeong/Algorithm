//
//  파티.swift
//  Algorithm
//
//  Created by 전소영 on 2023/09/25.
//

import Foundation
//n m x
//4 8 2
//1 2 4 시작, 끝, 소요시간
//1 3 2
//1 4 7
//2 1 1
//2 3 5
//3 1 2
//3 4 4
//4 2 3
func solution1238() {
    struct Heap {
        var heap: [(Int, Int)] = []

        func isEmpty() -> Bool {
            return heap.isEmpty
        }
        
        // 최소힙
        mutating func insert(_ node: (Int, Int)) {
            heap.append(node)
            var currentIndex = heap.count - 1
            while currentIndex > 0, heap[currentIndex].1 < heap[currentIndex / 2].1 { // 자식 < 부모
                heap.swapAt(currentIndex, currentIndex / 2)
                currentIndex = currentIndex / 2
            }
        }

        mutating func delete() -> (Int, Int) {
            var currentIndex = 0
            let minimumValue = heap[0]
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()

            while currentIndex * 2 < heap.count {
                let leftChildIndex = currentIndex * 2
                let rightChildIndex = currentIndex * 2 + 1
                var minimumChildIndex = leftChildIndex

                if rightChildIndex < heap.count, heap[rightChildIndex].1 < heap[leftChildIndex].1 { // 좌, 우
                    minimumChildIndex = rightChildIndex
                }

                if heap[minimumChildIndex].1 < heap[currentIndex].1 { // 부모, 자식
                    heap.swapAt(minimumChildIndex, currentIndex)
                    currentIndex = minimumChildIndex
                } else {
                    break
                }
            }

            return minimumValue
        }
    }

    func dijkstra(_ start: Int) -> [Int] {
        var heap = Heap()
        var visited: [Int] = Array(repeating: Int.max, count: n + 1)
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

    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, x) = (input[0], input[1], input[2])
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    var distances = [Int](repeating: 0, count: n + 1)
    
    for _ in 0..<m {
        let info = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[info[0]].append((info[1], info[2]))
    }
    
    distances = dijkstra(x) // 2에서 각 노드에 접근

    for student in 1...n {
        distances[student] += dijkstra(student)[x] // 각 노드에서 2에 접근, 도착
    }

    distances.removeFirst()
    print(distances.max()!)
}
