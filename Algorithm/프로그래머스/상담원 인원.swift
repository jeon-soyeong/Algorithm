//
//  상담원 인원.swift
//  Algorithm
//
//  Created by 전소영 on 2023/10/25.
//

import Foundation

// k    n    reqs    result
// 3    5    [[10, 60, 1], [15, 100, 3], [20, 30, 1], [30, 50, 3], [50, 40, 1], [60, 30, 2], [65, 30, 1], [70, 100, 2]]    25
// 2    3    [[5, 55, 2], [10, 90, 2], [20, 40, 2], [50, 45, 2], [100, 50, 2]]    90
func solution214288(_ k: Int, _ n: Int, _ reqs: [[Int]]) -> Int {
    func getPermutation(k: Int, n: Int) -> [[Int]] { // 유형: 3, 전체 명수: 5
        var permutation: [[Int]] = []
        let maxValue = n - k + 1
        
        func makePermutation(i: Int, temp: [Int]) { // [[1, 1, 3], [1, 2, 2] ...]
            let sum = temp.reduce(0, +)
            
            if temp.count < k - 1 { // 배열 요소 자리가 남아있을 때
                for j in 1...maxValue {
                    if j + sum < n {
                        makePermutation(i: j, temp: temp + [j])
                    }
                }
            } else { // 마지막 요소 자리만 남았을 때
                permutation.append(temp + [n - sum])
            }
        }
        
        makePermutation(i: 1, temp: [])
            
        return permutation
    }

    func getWaitingTime(reqs: [[Int]], n: Int) -> Int { // reqs[2] = 상담유형, n = 멘토수
        var counselors = Array(repeating: 0, count: n)
        var nextCounselor = 0
        var waitingTime = 0
        
        for req in reqs {
            let start = req[0]
            let duration = req[1]
            
            let current = counselors[nextCounselor] // 70
            if current > start {
                waitingTime += current - start
                counselors[nextCounselor] = current + duration
            } else {
                counselors[nextCounselor] = start + duration
            }
            
            if let min = counselors.min(), let minIndex = counselors.firstIndex(of: min) { // 비어있는, 먼저 끝나는 멘토에게 배정
                nextCounselor = minIndex
            }
        }
        
        return waitingTime
    }
    
    var reqDictionary: [Int: [[Int]]] = [:]
    
    for i in 1...k {
        reqDictionary[i] = []
    }

    for req in reqs {
        reqDictionary[req[2]]?.append(contentsOf: [req])
    }
    
    var minimumWaitingTime = Int.max
    let permutations = getPermutation(k: k, n: n)
    
    for permutation in permutations {
        var temp = 0
        
        for (index, value) in permutation.enumerated() { // 1, 1, 3 (각 유형별 counselor 명수)
            let waitingTime = getWaitingTime(reqs: reqDictionary[index + 1]!, n: value)
            temp += waitingTime
                
            if minimumWaitingTime < waitingTime {
                break
            }
        }
        
        if minimumWaitingTime > temp {
            minimumWaitingTime = temp
        }
    }

    return minimumWaitingTime
}
