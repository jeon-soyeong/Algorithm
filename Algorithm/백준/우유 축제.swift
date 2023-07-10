//
//  우유 축제.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/10.
//

import Foundation
//7
//0 1 2 0 1 2 0
// == 7
func solution14720() {
    let n = Int(readLine()!)!
    let milkArray = [0, 1, 2]
    var storeArray = readLine()!.split(separator: " ").map { Int(String($0))! }
    var temp = 0
    var answer = 0
    
    for store in storeArray {
        if store == milkArray[temp % 3] {
            temp += 1
            answer += 1
        }
    }
    
    print(answer)
}
