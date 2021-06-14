//
//  성지키기.swift
//  Algorithm
//  - 구현
//  Created by 전소영 on 2021/06/14.
//

import Foundation

func saveCastle() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = readline[0]
    let m = readline[1]
    var castleArray: [[String]] = []
    var row = Array(repeating: 0, count: 4)
    var column = Array(repeating: 0, count: 4)
    var rowCount = 0
    var columnCount = 0
    
    for _ in 0..<n {
        let readline = readLine()!.split(separator: " ").map{ String($0) }
        castleArray.append(readline)
    }
   
    for i in 0..<n {
        for j in 0..<m {
            if (castleArray[i][j].contains("X")) == true {
                row[i] = 1
                column[j] = 1
            }
        }
    }
    
    for i in 0..<row.count {
        if row[i] == 0 {
            rowCount += 1
        }
    }
    for j in 0..<column.count {
        if column[j] == 0 {
            columnCount += 1
        }
    }
    
    print(max(rowCount, columnCount))
}
