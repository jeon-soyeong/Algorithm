//
//  테이블 해시 함수.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/13.
//

import Foundation
// data                                    col    row_begin    row_end    result
// [[2,2,6],[1,5,10],[4,2,9],[3,8,3]]      2      2            3          4
func solution147354(_ data: [[Int]], _ col: Int, _ row_begin: Int, _ row_end: Int) -> Int {
    var result = 0
    let sortedData = data.sorted { $0[col - 1] == $1[col - 1] ? $0[0] > $1[0] : $0[col - 1] < $1[col - 1] }
    
    for i in row_begin - 1...row_end - 1 {
        result ^= sortedData[i].reduce(0) { $0 + ($1 % (i + 1)) }
    }
    
    return result
}
