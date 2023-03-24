//
//  택배 배달과 수거하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/23.
//

import Foundation
//2    7    [1, 0, 2, 0, 1, 0, 2]    [0, 2, 0, 1, 0, 2, 0]
func solution150369(_ cap: Int, _ n: Int, _ deliveries: [Int], _ pickups: [Int]) -> Int64 {
    var deliveries = deliveries
    var pickups = pickups
    
    deliveries.reverse()
    pickups.reverse()
    
    var d = 0
    var p = 0
    var answer = 0
    
    for i in 0..<n {
        if deliveries[i] != 0 || pickups[i] != 0 {
            var count = 0
            while d < deliveries[i] || p < pickups[i] {
                count += 1
                d += cap
                p += cap
            }
            d -= deliveries[i]
            p -= pickups[i]
            answer += (n - i) * 2 * count
        }
    }

    return Int64(answer)
}
