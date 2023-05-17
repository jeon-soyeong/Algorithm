//
//  표현 가능한 이진트리.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/17.
//

import Foundation

func solution150367(_ numbers: [Int64]) -> [Int] {
    var answer: [Int] = []

    func checkBinaryTree(_ c: [Character]) -> Bool {
        if c.count == 1 {
            return true
        }
        
        let middle = c.count / 2
        let front = Array(c[..<middle])
        let back = Array(c[(middle + 1)...])
        
        if c[middle] == "0", front.contains("1") || back.contains("1") {
            return false
        }
        
        return checkBinaryTree(front) && checkBinaryTree(back)
    }

    for number in numbers {
        let binaryNumber = String(Int(number), radix: 2)
        let length = binaryNumber.count
        let totalLength = pow(2, Double(Int(log2(Double(length))) + 1)) - 1
        let zeros = String(repeating: "0", count: Int(totalLength) - length)

        answer.append(checkBinaryTree(Array(zeros + binaryNumber)) ? 1 : 0)
    }

    return answer
}
