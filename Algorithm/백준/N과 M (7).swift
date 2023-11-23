//
//  N과 M (7).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/23.
//

import Foundation

func solution15656() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = nm[1]
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer: [String] = []
    var answerString = ""
    
    array.sort()
    
    func back() {
        if answer.count == m {
            answerString += answer.joined(separator: " ")
            answerString += "\n"
            return
        }
        
        for i in 0..<array.count {
            answer.append(String(array[i]))
            back()
            answer.removeLast()
        }
    }
    
    back()
    print(answerString)
}
