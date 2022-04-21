//
//  이진 변환 반복하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/19.
//

import Foundation

func solutionBinary(_ s: String) -> [Int] {
    var zeroCount = 0
    var transCount = 0
    var transString = s
    
    while transString != "1" {
        var stringArray = Array(transString)
        for i in 0..<stringArray.count {
            if stringArray[i] == "0" {
                zeroCount += 1
            }
        }
        transString = transString.replacingOccurrences(of: "0", with: "")
        transString = String(transString.count, radix: 2)
        transCount += 1
    }
    
    return [transCount, zeroCount]
}
