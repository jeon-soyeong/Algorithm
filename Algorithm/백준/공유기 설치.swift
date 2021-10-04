//
//  공유기 설치.swift
//  Algorithm
//  - 이분 탐색, 매개 변수 탐색
//  Created by 전소영 on 2021/06/15.
//

import Foundation

func setUpWifi() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let N = readline[0]
    let C = readline[1]
    var homeArray: [Int] = []
    var left = 1
    var distance = 0
    var answer = 0
    
    for _ in 0..<N {
        homeArray.append(Int(readLine()!)!)
    }
    
    var right = homeArray[N - 1] - homeArray[0]

    homeArray.sort()
  
    while left <= right {
        let mid = (left + right) / 2
        var start = homeArray[0]
        var count = 1
        
        for i in 0..<N {
            distance = homeArray[i] - start
            if mid <= distance {
                count += 1
                start = homeArray[i]
            }
        }
        
        if count >= C {
            answer = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    print(answer)
}
