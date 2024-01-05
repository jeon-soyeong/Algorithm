//
//  DSLR.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2024/01/04.
//

import Foundation
// 3
// 1234 3412   LL
// 1000 1      L
// 1 16        DDDD
func solution9019() {
    let n = Int(readLine()!)!
    var answer: [String] = []
    
    for _ in 0..<n {
        var visited = Array(repeating: false, count: 10001)
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0], b = ab[1]
        visited[a] = true
        
        var queue = [(a, "")]
        var index = 0
        while !queue.isEmpty {
            let q = queue[index]
            index += 1
            let number = q.0
            let command = q.1
            
            if number == b {
                answer.append(command)
                break
            }
            
//        D: D 는 n을 두 배로 바꾼다. 결과 값이 9999 보다 큰 경우에는 10000 으로 나눈 나머지를 취한다. 그 결과 값(2n mod 10000)을 레지스터에 저장한다.
            let d = number * 2 % 10000
            if !visited[d] {
                queue.append((d, command + "D"))
                visited[d] = true
            }
            
//        S: S 는 n에서 1을 뺀 결과 n - 1 을 레지스터에 저장한다. n이 0 이라면 9999 가 대신 레지스터에 저장된다.
            let s = number - 1 < 0 ? 9999 : number - 1
            if !visited[s] {
                queue.append((s, command + "S"))
                visited[s] = true
            }
            
//        L: L 은 n의 각 자릿수를 왼편으로 회전시켜 그 결과를 레지스터에 저장한다. 이 연산이 끝나면 레지스터에 저장된 네 자릿수는 왼편부터 d2, d3, d4, d1이 된다.
            // 1234 →L 2341 →L 3412
            let l = number / 1000 + (number % 1000) * 10
            if !visited[l] {
                queue.append((l, command + "L"))
                visited[l] = true
            }
            
//        R: R 은 n의 각 자릿수를 오른편으로 회전시켜 그 결과를 레지스터에 저장한다. 이 연산이 끝나면 레지스터에 저장된 네 자릿수는 왼편부터 d4, d1, d2, d3이 된다.
//            1234 →R 4123 →R 3412
            let r = (number % 10) * 1000 + number / 10
            if !visited[r] {
                queue.append((r, command + "R"))
                visited[r] = true
            }
        }
    }
    
    print(answer.joined(separator: "\n"))
}
