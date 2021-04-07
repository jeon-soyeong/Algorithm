//
//  키로거.swift
//  Algorithm
//  - 자료 구조, 스택, 덱, 연결 리스트
//  Created by 전소영 on 2021/04/02.
//

import Foundation

func soulution() {
    var leftStack: [String] = []
    var rightStack: [String] = []
    let readline = readLine()!.split(separator: " ").map{ String($0) }

    for data in readline[0] {
        if data == "<" {
            if leftStack.isEmpty == false {
                rightStack.append(leftStack.removeLast())
            }
        } else if data == ">" {
            if rightStack.isEmpty == false {
                leftStack.append(rightStack.removeLast())
            }
        } else if data == "-" {
            if leftStack.isEmpty == false {
                leftStack.removeLast()
            }
        } else {
            leftStack.append(String(data))
        }
    }

    leftStack.append(contentsOf: rightStack.reversed())
    print(leftStack.joined())
}
