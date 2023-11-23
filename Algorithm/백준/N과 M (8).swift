//
//  N과 M (8).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/23.
//

import Foundation
//1 1
//1 7
//1 8
//1 9
//7 7
//7 8
//7 9
//8 8
//8 9
//9 9
func solution15657() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = nm[1]
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer: [String] = []
    var answerString = ""
    
    array.sort()
    
    func back(_ now: Int) {
        if answer.count == m {
            answerString += answer.joined(separator: " ")
            answerString += "\n"
            return
        }
        
        for i in now..<array.count {
            answer.append(String(array[i]))
            back(i)
            answer.removeLast()
            
        }
    }
    
    back(0)
    print(answerString)
}
