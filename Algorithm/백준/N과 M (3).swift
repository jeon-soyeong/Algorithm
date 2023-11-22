//
//  N과 M (3).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/22.
//

import Foundation
//4 2
//
//1 1
//1 2
//1 3
//1 4
//2 1
//2 2
//2 3
//2 4
//3 1
//3 2
//3 3
//3 4
//4 1
//4 2
//4 3
//4 4
func solution15651() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var array: [Int] = []
    var answer = ""
    
    func back() {
        if array.count == m {
            answer += array.map { String($0) }.joined(separator: " ")
            answer += "\n"
            return
        }
        
        for i in 1...n {
            array.append(i)
            back()
            array.removeLast()
        }
    }
    
    back()
    print(answer)
}
