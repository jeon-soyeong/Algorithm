//
//  최소직사각형.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/15.
//

import Foundation
//sizes                                            result
//[[60, 50], [30, 70], [60, 30], [80, 40]]         4000
//[[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]    120
//[[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]    133

func solution86491(_ sizes: [[Int]]) -> Int {
    let w: Int = sizes.map { $0.max() ?? 0 }.max() ?? 0
    let h: Int = sizes.map { $0.min() ?? 0 }.max() ?? 0
    
    return w * h
}
