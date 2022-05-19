//
//  모두 0으로 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/19.
//

import Foundation
// a                edges                        result
// [-5,0,2,1,2]     [[0,1],[3,4],[2,3],[0,3]]    9
// [0,1,0]          [[0,1],[1,2]]                -1
func solution76503(_ a: [Int], _ edges: [[Int]]) -> Int64 {
    var children: [[Int]] = Array(repeating: [Int](), count: a.count)
    var weights = a
    var answer: Int64 = 0

    if checkWeightSumZero(weights: weights) {
        setChildren(edges: edges, children: &children)
        findLeafNode(current: 0, parent: 0, children: children, weights: &weights, answer: &answer)
        return answer
    }
    
    return -1
}

func setChildren(edges: [[Int]], children: inout [[Int]])  {
    for edge in edges {
        children[edge[0]].append(edge[1])
        children[edge[1]].append(edge[0])
    }
}

func findLeafNode(current: Int, parent: Int, children: [[Int]], weights: inout [Int], answer: inout Int64) {
    //현재 노드와 연결된 자식들을 순회함
    for child in children[current] {
        //만약 연결된 것들 중 부모가 아니라면
        if child != parent {
            //dfs로 그 아래 자식들로 순회함
            findLeafNode(current: child, parent: current, children: children, weights: &weights, answer: &answer)
        }
    }
    //부모의 가중치에 자식의 값을 더함
    weights[parent] += weights[current]
    //최소치에 자식들의 절댓값을 더함
    answer += Int64(abs(weights[current]))
}

func checkWeightSumZero(weights: [Int]) -> Bool {
    return weights.reduce(0, +) == 0
}
