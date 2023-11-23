//
//  N과 M (9).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/23.
//

import Foundation
//4 2
//9 7 9 1
//
//1 7
//1 9
//7 1
//7 9
//9 1
//9 7
//9 9
func solution15663() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (nm[0], nm[1])
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.sort()
    var answer: [String] = []
    var arraySet: Set<String> = []
    var visited = Array(repeating: false, count: n)
    
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
            if !visited[i] {
                visited[i] = true
                answer.append(String(array[i]))
                back()
                visited[i] = false
                answer.removeLast()
            }
        }
    }
    
    back()
}
