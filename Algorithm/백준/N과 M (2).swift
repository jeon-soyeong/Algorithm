//
//  N과 M (2).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/22.
//

import Foundation
//4 2
//
//1 2
//1 3
//1 4
//2 3
//2 4
//3 4
func solution15650() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var array: [Int] = []
    
    for i in 1...n {
        array.append(i)
    }
    
    func back(_ temp: [Int], _ index: Int) {
        if temp.count == m {
            print(temp.map { String($0) }.joined(separator: " "))
            return
        }
        
        for i in index..<array.count {
            back(temp + [array[i]], i + 1)
        }
    }
    
    back([], 0)
}
