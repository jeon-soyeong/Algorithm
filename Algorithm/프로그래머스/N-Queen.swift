//
//  N-Queen.swift
//  Algorithm
//  백트래킹
//  Created by 전소영 on 2022/11/21.
//

import Foundation

func solution12952(_ n: Int) -> Int {
    var answer = 0
    var chess = [Int](repeating: -1, count: n)

    // 열, 대각선 같지 않을 때 true
    func checkQueen(_ x: Int, _ y: Int) -> Bool { // 행, 열
        for i in 0..<x {
            if chess[i] == y || abs(x - i) - abs(y - chess[i]) == 0 {
                return false
            }
        }

        return true
    }

    func nQueen(index: Int) { // 행
        if index == n {
            answer += 1
            return
        }

        for i in 0..<n { // 열
            if checkQueen(index, i) {
                chess[index] = i
                nQueen(index: index + 1)
            }
        }
    }

    nQueen(index: 0)

    return answer


//    var answer = 0
//    var chess = [Int](repeating: -1, count: n)
//
//    // 열, 대각선 같지 않을 때 true
//    func checkQueen(_ x: Int) -> Bool { // 행, 열
//        for i in 0..<x {
//            if chess[i] == chess[x] || abs(x - i) - abs(chess[x] - chess[i]) == 0 {
//                return false
//            }
//        }
//
//        return true
//    }
//
//    func nQueen(index: Int) { // 행
//        if index == n {
//            answer += 1
//            return
//        }
//
//        for i in 0..<n { // 열
//            chess[index] = i
//            if checkQueen(index) {
//                nQueen(index: index + 1)
//            }
//        }
//    }
//
//    nQueen(index: 0)
//
//    return answer
}
