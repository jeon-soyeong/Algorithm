//
//  N과 M (1).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/21.
//

import Foundation
//4 2
//1 ~ 4 까지 2개 뽑기
//1 2
//1 3
//1 4
//2 1
//2 3
//2 4
//3 1
//3 2
//3 4
//4 1
//4 2
//4 3
func solution15649() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var array: [Int] = []
    var answer: [Int] = []
    
    for i in 1...n {
        array.append(i)
    }
    
    func back() {
        if answer.count == m {
            print(answer.map{ String($0) }.joined(separator: " "))
            return
        }
        
        for i in 0..<array.count {
            if !answer.contains(array[i]) {
                answer.append(array[i])
                back()
                answer.removeLast()
            }
        }
    }
    
    back()
}
