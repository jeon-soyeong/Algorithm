//
//  디펜스 게임.swift
//  Algorithm
//  - 우선순위 큐, 힙(heap)
//  Created by 전소영 on 2023/03/20.
//

import Foundation
// n    k    enemy                   result
// 7    3    [4, 2, 4, 5, 3, 3, 1]    5
// 2    4    [3, 3, 3, 3]             4
func solution142085(_ n: Int, _ k: Int, _ enemy: [Int]) -> Int {
    var n = n
    var k = k
    var count = 0
    var maxHeap = Heap<Int>(sort: >)
    
    for e in enemy {
        maxHeap.insert(e)
        if n - e >= 0 {
            n -= e
        } else if k > 0 {
            n = n - e + maxHeap.pop()
            k -= 1
        } else {
            return count
        }
        count += 1
    }
    
    return count
}

struct Heap<T: Comparable> {
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        while index > 0, sort(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    mutating func pop() -> T {
        nodes.swapAt(0, nodes.count - 1)
        let node = nodes.removeLast()
        var index = 0
        
        while index * 2 + 1 < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
            } else {
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else {
                    break
                }
            }
        }
        
        return node
    }
}

// https://velog.io/@qnm83/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EB%94%94%ED%8E%9C%EC%8A%A4-%EA%B2%8C%EC%9E%84Swift
// https://gmlwjd9405.github.io/2018/05/10/data-structure-heap.html
