//
//  스티커 모으기(2).swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/29.
//

import Foundation

// sticker                        answer
// [14, 6, 5, 11, 3, 9, 2, 10]    36
// [1, 3, 2, 5, 4]                8
// [5, 1, 16, 17, 16]
func solution12971(_ sticker: [Int]) -> Int {
    var answer = 0
    var dp1 = Array(repeating: 0, count: sticker.count)
    var dp2 = Array(repeating: 0, count: sticker.count)

    if sticker.count <= 3 {
        return sticker.max()!
    }

    // 첫번째 O 마지막 X
    dp1[0] = sticker[0]
    dp1[1] = max(sticker[0], sticker[1])

    for i in 2..<sticker.count - 1 {
        dp1[i] = max(dp1[i - 2] + sticker[i], dp1[i - 1])
    }

    // 첫번째 X 마지막 O
    dp2[0] = 0
    dp2[1] = sticker[1]

    for j in 2..<sticker.count {
        dp2[j] = max(dp2[j - 2] + sticker[j], dp2[j - 1])
    }

    answer = max(dp1.max()!, dp2.max()!)
    
    return answer
}
