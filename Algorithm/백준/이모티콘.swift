//
//  이모티콘.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/16.
//

import Foundation

func solution14226() {
    let s = Int(readLine()!)!
    var answer = 0
    
    var queue: [(count: Int, copyCount: Int, time: Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: 2000), count: 2000)
    queue.append((count: 1, copyCount: 0, time: 0))

    while !queue.isEmpty {
        let q = queue.removeFirst()
        if q.count == s {
            answer = q.time
            break
        }
        
        if q.count > 0, q.count < 2000 {
            if !visited[q.count][q.count] { // 클립보드 복사
                visited[q.count][q.count] = true
                queue.append((count: q.count, copyCount: q.count, time: q.time + 1))
            }
            
            if !visited[q.count - 1][q.copyCount] { // 삭제
                visited[q.count - 1][q.copyCount] = true
                queue.append((count: q.count - 1, copyCount: q.copyCount, time: q.time + 1))
            }
        }
        
        if q.copyCount > 0, q.count + q.copyCount < 2000 {
            if !visited[q.count + q.copyCount][q.copyCount] { // 붙여넣기
                visited[q.count + q.copyCount][q.copyCount] = true
                queue.append((count: q.count + q.copyCount, copyCount: q.copyCount, time: q.time + 1))
            }
        }
    }
    
    print(answer)
}
