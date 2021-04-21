//
//  파보나치 수.swift
//  Algorithm
//
//  Created by 전소영 on 2021/04/21.
//

import Foundation

func solution(_ n: Int) -> Int {
  var fibonacci: [Int] = [0, 1]

  for i in 2...n {
    fibonacci.append((fibonacci[i-2] + fibonacci[i-1]) % 1234567)
  }

  return fibonacci[n]
}

//func solution(_ n: Int) -> Int {
//    var f1 = 0, f2 = 1
//    for _ in 2...n {
//        let temp = (f1 + f2) % 1234567
//        f1 = f2
//        f2 = temp
//    }
//    return f2
//}

