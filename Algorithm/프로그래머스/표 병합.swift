//
//  표 병합.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/24.
//

import Foundation

// ["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle",

//      "MERGE 1 2 1 3", "MERGE 1 3 1 4",
//      "UPDATE korean hansik", "UPDATE 1 3 group",
//      "UNMERGE 1 4",
//      "PRINT 1 3", "PRINT 1 4"]    ["EMPTY", "group"]
func solution150366(_ commands: [String]) -> [String] {
    var graph: [[String?]] = Array(repeating: Array(repeating: nil, count: 51), count: 51)
    var merged: [[(Int, Int)]] = []
    var answer: [String] = []
    
    for x in 0...50 {
        var temp: [(Int, Int)] = []
        for y in 0...50 {
            temp.append((x, y))
        }
        merged.append(temp)
    }
    
    for command in commands {
        let c = command.split(separator: " ").map { String($0) }
        switch c[0] {
        case "UPDATE":
            if c.count == 4 { // UPDATE 1 1 menu"
                let x = Int(c[1])!
                let y = Int(c[2])!
                
                let (mX, mY) = merged[x][y]
                graph[mX][mY] = c[3]
            } else { // UPDATE korean hansik
                for i in 1...50 {
                    for j in 1...50 {
                        if graph[i][j] == c[1] {
                            graph[i][j] = c[2]
                        }
                    }
                }
            }
        case "MERGE": // "MERGE 1 2 1 3"
            let x1 = Int(c[1])!
            let y1 = Int(c[2])!
            let x2 = Int(c[3])!
            let y2 = Int(c[4])!
            
            if x1 == x2, y1 == y2 {
                break
            }
            
            let (mx1, my1) = merged[x1][y1]
            let (mx2, my2) = merged[x2][y2]
            
            if let text1 = graph[mx1][my1] {
                graph[mx2][my2] = text1
            } else if let text2 = graph[mx2][my2] {
                graph[mx1][my1] = text2
            }
            
            for i in 0...50 {
                for j in 0...50 {
                    if merged[i][j] == (mx2, my2) {
                        merged[i][j] = merged[mx1][my1]
                    }
                }
            }
        case "UNMERGE": // UNMERGE 1 4
            let x1 = Int(c[1])!
            let y1 = Int(c[2])!
            let (mx1, my1) = merged[x1][y1]
            
            let text = graph[mx1][my1]
            
            for i in 1...50 {
                for j in 1...50 {
                    if merged[i][j] == (mx1, my1) {
                        merged[i][j] = (i, j)
                        graph[i][j] = nil
                    }
                }
            }
            
            graph[x1][y1] = text
        case "PRINT": // "PRINT 1 3"
            let x1 = Int(c[1])!
            let y1 = Int(c[2])!
            let (mx1, my1) = merged[x1][y1]
            
            if let data = graph[mx1][my1] {
                answer.append(data)
            } else {
                answer.append("EMPTY")
            }
        default:
            break
        }
    }
    
    return answer
}
