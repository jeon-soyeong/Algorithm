//
//  점찍기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/02.
//

import Foundation

func solution140107(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0
    let dPow = d * d
    
    for x in 0...d {
      if x * k > d {
        break
      }
      let xPow = (x * k) * (x * k)
      let y = Int64(sqrt(Double(dPow - xPow)))
      answer += y / Int64(k) + 1
    }
    
    return answer
}
