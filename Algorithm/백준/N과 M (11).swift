//
//  N과 M (11).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/24.
//

import Foundation
//1 1
//1 7
//1 9
//7 1
//7 7
//7 9
//9 1
//9 7
//9 9
func solution15665() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = nm[1]
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.sort()
    var answer: [String] = []
    var arraySet: Set<String> = []
    
    func back() {
        if answer.count == m {
            let answerString = answer.joined(separator: " ")
            if !arraySet.contains(answerString) {
                arraySet.insert(answerString)
                print(answerString)
            }
            return
        }

        for i in 0..<array.count {
            answer.append(String(array[i]))
            back()
            answer.removeLast()
        }
    }
    
    back()
}
