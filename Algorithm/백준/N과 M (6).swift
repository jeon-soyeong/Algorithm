//
//  N과 M (6).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/22.
//

import Foundation
//4 2
//9 8 7 1

//1 7
//1 8
//1 9
//7 8
//7 9
//8 9
func solution15655() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (nm[0], nm[1])
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.sort()
    var answer: [Int] = []
    
    func back(_ now: Int) {
        if answer.count == m {
            print(answer.map{ String($0) }.joined(separator: " "))
            return
        }
        
        for i in now..<array.count {
            if !answer.contains(array[i]) {
                answer.append(array[i])
                back(i)
                answer.removeLast()
            }
        }
    }
    
    back(array.first!)
}
