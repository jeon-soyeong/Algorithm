//
//  DFS와 BFS.swift
//  Algorithm
//  - 그래프 이론, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색
//  Created by 전소영 on 2021/03/29.
//

import Foundation

func solution() {
    let readline = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let (n, start) = (readline[1], readline[2])
    var graph = [Int: [Int]]()

    for _ in 0..<n {
        let readline = readLine()!.split{ $0 == " " }.map{ Int($0)! }
        let start = readline[0]
        let end = readline[1]

        if graph[start] == nil {
            graph[start] = [end]
        } else {
            graph[start]?.append(end)
        }
        if graph[end] == nil {
            graph[end] = [start]
        } else {
            graph[end]?.append(start)
        }
    }

    for key in graph.keys {
        graph[key]?.sort(by: >)
    }

    var printDFSResult = ""
    for i in DFS(graph, start) {
        printDFSResult += String(i) + " "
    }

    for key in graph.keys {
        graph[key]?.sort(by: <)
    }

    var printBFSResult = ""
    for i in BFS(graph, start) {
        printBFSResult += String(i) + " "
    }
    
    print(printDFSResult)
    print(printBFSResult)
}

func DFS(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
    var visited = [Int]()
    var stack = [start]

    while stack.count > 0 {
        let node = stack.popLast()!
        if visited.contains(node) {
            continue
        } else {
            visited.append(node)
            if let tmp = graph[node] {
                stack += tmp
            }
        }
    }
    return visited
}

func BFS(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
    var visited = [Int]()
    var queue = [start]

    while queue.count > 0 {
        let node = queue.remove(at: 0)
        if visited.contains(node) {
            continue
        } else {
            visited.append(node)
            if let tmp = graph[node] {
                queue += tmp
            }
        }
    }
    return visited
}
