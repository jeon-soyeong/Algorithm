//
//  신규 아이디 추천.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/23.
//

import Foundation

func recommendNewId(_ new_id: String) -> String {
    var newId = new_id.lowercased()
    let characters = ["-", "_", "."]
    newId = newId.filter { $0.isLetter || $0.isNumber || characters.contains(String($0)) }.map { String($0) }.joined()
    
    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    
    if newId.first == "."  {
        newId.removeFirst()
    }
    
    if newId.last == "." {
        newId.removeLast()
    }

    if newId.isEmpty {
        newId = "a"
    }

    if newId.count >= 16 {
        newId = String(newId.prefix(15))
        if newId.last == "." {
            newId.removeLast()
        }
    }

    while newId.count <= 2 {
        if let last = newId.last {
            newId = newId + String(last)
        }
    }
    
    return newId
}
