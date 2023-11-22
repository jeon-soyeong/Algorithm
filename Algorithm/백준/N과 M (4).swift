//
//  N과 M (4).swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/22.
//

import Foundation

func solution15652() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var array: [Int] = []
    
    func back(_ now: Int) {
        if array.count == m {
            print(array.map { String($0) }.joined(separator: " "))
            return
        }
        
        for i in now...n {
            array.append(i)
            back(i)
            array.removeLast()
        }
    }
    
    back(1)
}
