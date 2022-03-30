//
//  멀쩡한 사각형.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/28.
//

import Foundation

func solution(_ w: Int, _ h: Int) -> Int64 {
    var a = w
    var b = h
    while a % b != 0 {
        let x = a % b
        a = b
        b = x
    }

    return Int64(w * h - (w + h - b))
}
