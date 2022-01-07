//
//  파일명 정렬.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/06.
//

import Foundation

func solution(_ files: [String]) -> [String] {
    var file: [(head: String, number: Int, order: Int)] = []
    var result: [String] = []
    
    let numeric: ClosedRange<Character> = "0"..."9"
    
    for i in 0..<files.count {
        let head = files[i].prefix { numeric.contains($0) == false }
        let number = files[i].drop { numeric.contains($0) == false }.prefix { numeric.contains($0) == true }
        
        file.append((head: head.lowercased(), number: Int(number)!, order: i))
    }
    
    file.sort {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.order < $1.order
            }
            return $0.number < $1.number
        }
        return $0.head < $1.head
    }
    
    for tuple in file {
        result.append(files[tuple.2])
    }
    
    return result
}
