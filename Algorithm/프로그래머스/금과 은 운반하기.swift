//
//  금과 은 운반하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/17.
//

import Foundation
// a     b        g            s           w              t         result
// 10    10     [100]        [100]        [7]            [10]       50
func solution86053(_ a: Int, _ b: Int, _ g: [Int], _ s: [Int], _ w: [Int], _ t: [Int]) -> Int64 {
    var start: Int = 0
    var end: Int = Int(10e15)
    var answer: Int = end
    
    while start <= end {
        let mid: Int = (start + end) / 2
        var gold: Int = 0
        var silver: Int = 0
        var total: Int = 0
        
        // a     b        g            s           w              t         result
        // 90    500    [70,70,0]    [0,0,500]    [100,100,2]    [4,8,1]    499
        // 각 트럭의 광물의 양과 시간 내에 운반할 수 있는 횟수 * 무게의 양)을 비교해서 더 작은 쪽이 최대치가 됩니다.
        // 이렇게 이진 탐색을 이용해서 광물을 운반할 수 없을 때까지 반복합니다.
        for i in 0..<s.count {
            var count = mid / (t[i] * 2) //시간 내에 운반할 수 있는 횟수
//             주어진 시간: 11. 2씩 걸릴 때, 주어진 시간: 9. 2씩 걸릴 때
            if mid % (t[i] * 2) >= t[i] {
                count += 1
            }
            gold += min(g[i], w[i] * count)
            silver += min(s[i], w[i] * count)
            total += min(g[i] + s[i], w[i] * count)
        }
        
        if gold >= a && silver >= b && total >= a + b {
            end = mid - 1
            answer = min(mid, answer)
        } else {
            start = mid + 1
        }
    }
    
    return Int64(answer)
}
