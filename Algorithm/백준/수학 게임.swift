//
//  수학 게임.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/12.
//

import Foundation

func solution2862() {
    var n = Int(readLine()!)!
    var fibonacci = Array(repeating: 0, count: 80)
    fibonacci[1] = 1
    fibonacci[2] = 1
    
    for i in 3..<80 {
        fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
    }
    
    /*
     N이 30일때, 30 이하의 가장 큰 피보나치 수는 21이므로 N이 9일 때 게임을 하는 것과 같게 되고,
     다시, N이 9라면, 9 이하의 가장 큰 피보나치 수는 8이므로 N이 1일 때 게임을 하는 것과 같게 됨.
     따라서 N이 30일 때는 구슬을 1개만 가져가 게임에서 이길 수 있음.
     */
    while true {
        var temp = n
        for i in 1..<80 {
            if temp < fibonacci[i] {
                temp = fibonacci[i - 1]
                break
            }
        }
               
        // N 자체가 피보나치 수일 경우 반복문 종료.
        if temp == n {
            break
        }

        n -= temp
    }
    
    print(n)
}
