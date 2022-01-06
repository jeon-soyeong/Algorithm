//
//  압축.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/05.
//

import Foundation

func solution(_ msg: String) -> [Int] {
    var dictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var message = msg.map { String($0) }
    var result: [Int] = []
    var input: String = ""
    
    while !message.isEmpty {
        input += message.removeFirst()
        
        guard let next = message.first else {
            result.append(dictionary.firstIndex(of: input)! + 1)
            break
        }
        
        if let index = dictionary.firstIndex(of: input), !dictionary.contains(input + next) {
            result.append(index + 1)
            dictionary.append(input + next)
            input = ""
        }
    }
    
    return result
}
