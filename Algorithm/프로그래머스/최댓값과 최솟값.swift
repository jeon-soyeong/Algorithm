//
//  최댓값과 최솟값.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/12.
//

import Foundation

func solution12939(_ s: String) -> String {
    let sArray = s.components(separatedBy: " ").map { Int($0)! }
    let max = sArray.max()!
    let min = sArray.min()!
    
    return "\(min) \(max)"
}
