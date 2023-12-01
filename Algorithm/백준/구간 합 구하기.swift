//
//  구간 합 구하기.swift
//  Algorithm
//  세그먼트 트리
//  Created by 전소영 on 2023/11/30.
//

import Foundation
//5 2 2
//1
//2
//3
//4
//5
//1 3 6
//2 2 5
//1 5 2
//2 3 5
func solution2042() {
    let nmk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nmk[0]
    let m = nmk[1]
    let k = nmk[2]
    
    var tree = Array(repeating: 0, count: n * 4)
    var array: [Int] = []
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    @discardableResult
    func createTree(start: Int, end: Int, node: Int) -> Int {
        if start == end {
            tree[node] = array[start]
            return tree[node]
        }
        
        let mid = (start + end) / 2
        tree[node] = createTree(start: start, end: mid, node: node * 2) + createTree(start: mid + 1, end: end, node: node * 2 + 1)
        return tree[node]
    }
    
    // start: 시작 end: 끝 index
    // min, max: 구해야 하는 범위
    func calculateSum(start: Int, end: Int, node: Int, min: Int, max: Int) -> Int {
        if end < min || max < start { // 범위 밖에 있는 경우
                return 0
            }
        if min <= start, end <= max { // 범위 안에 있는 경우만 더해주면 됨.
            return tree[node]
        }
        
        let mid = (start + end) / 2
        return calculateSum(start: start, end: mid, node: node * 2, min: min, max: max) +
        calculateSum(start: mid + 1, end: end, node: node * 2 + 1, min: min, max: max)
    }
    
    func update(start: Int, end: Int, node: Int, target: Int, value: Int) {
        if target < start || end < target {
            return
        }
        
        tree[node] += value
        
        if start == end {
            array[start] += value
            return
        }
        
        let mid = (start + end) / 2
        update(start: start, end: mid, node: node * 2, target: target, value: value)
        update(start: mid + 1, end: end, node: node * 2 + 1, target: target, value: value)
    }
    
    createTree(start: 0, end: n - 1, node: 1)
    var answer: [String] = []
    
    for _ in 0..<m + k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        if input[0] == 1 {
            let targetIndex = input[1] - 1
            let num = input[2]
            update(start: 0, end: n - 1, node: 1, target: targetIndex, value: num - array[targetIndex])
        } else {
            let min = input[1] - 1
            let max = input[2] - 1
            answer.append("\(calculateSum(start: 0, end: n - 1, node: 1, min: min, max: max))")
        }
    }
    
    print(answer.joined(separator: "\n"))
}
