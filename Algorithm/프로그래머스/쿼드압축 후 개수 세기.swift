//
//  쿼드압축 후 개수 세기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/23.
//

import Foundation
// [[1,1,0,0],
//  [1,0,0,0],
//  [1,0,0,1],
//  [1,1,1,1]]
func solution68936(_ arr: [[Int]]) -> [Int] {
    let n = arr.count
    var zeroCount = 0
    var oneCount = 0
    
    func quadTree(_ x: Int, _ y: Int, _ n: Int) {
        let first = arr[x][y]
        var flag = false
        
        for i in x..<x + n {
            if flag { break }
            for j in y..<y + n {
                if arr[i][j] != first {
                    quadTree(x, y, n / 2)
                    quadTree(x, y + n / 2, n / 2)
                    quadTree(x + n / 2, y, n / 2)
                    quadTree(x + n / 2, y + n / 2, n / 2)
                    flag = true
                    break
                }
            }
        }
        
        if !flag {
            if arr[x][y] == 0 {
                zeroCount += 1
            } else {
                oneCount += 1
            }
        }
    }
    
    quadTree(0, 0, n)
    
    return [zeroCount, oneCount]
}
