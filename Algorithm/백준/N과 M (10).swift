//
//  N과 M (10).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/24.
//

import Foundation
//1 7
//1 9
//7 9
//9 9
func solution15664() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (nm[0], nm[1])
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.sort()
    var answer: [String] = []
    var arraySet: Set<String> = []
    var visited = Array(repeating: false, count: n)
    
    func back(_ now: Int) {
        if answer.count == m { 
            let answerString = answer.joined(separator: " ")
            if !arraySet.contains(answerString) {
                arraySet.insert(answerString)
                print(answerString)
            }
            return
        }

        for i in now..<array.count {
            if !visited[i] {
                visited[i] = true
                answer.append(String(array[i]))
                back(i)
                visited[i] = false
                answer.removeLast()
            }
        }
    }
    
    back(0)
}
