//
//  방문 길이.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/10.
//

import Foundation

func solution49994(_ dirs: String) -> Int {
    let dirsArray = Array(dirs)
    var visitedSet: Set<String> = []
    var start = (0, 0)
    
    for dirs in dirsArray {
        var current = start
        var row = current.0
        var column = current.1
        
        switch dirs {
        case "U":
            column = column + 1
            break
        case "D":
            column = column - 1
            break
        case "L":
            row = row - 1
            break
        case "R":
            row = row + 1
            break
        default:
            break
        }
        
        current.0 = row
        current.1 = column
        
        if -5...5 ~= row, -5...5 ~= column {
            visitedSet.insert("\(current)\(start)")
            visitedSet.insert("\(start)\(current)")
            start = current
        }
    }
    
    return visitedSet.count / 2
}
