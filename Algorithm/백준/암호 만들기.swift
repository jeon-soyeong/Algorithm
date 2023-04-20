//
//  암호 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/20.
//

import Foundation

//4 6
//a t c i s w
func solution1759() {
    let input = readLine()!.split(separator: " ").map { Int(String($0)) }
    let l = input[0]!
    
    let vowel = ["a", "e", "i", "o", "u"]
    let consonant = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    
    var array = readLine()!.split(separator: " ").map { String($0) }
    array.sort()
        
    func combination<T>(target: [T], targetCount: Int, index: Int, temp: [T]) {
        if targetCount == temp.count {
            var vowelCount = 0
            var consonantCount = 0
            
            if let result = temp as? [String] {
                result.forEach { if vowel.contains($0) { vowelCount += 1 }  }
                result.forEach { if consonant.contains($0) { consonantCount += 1 }  }
                
                if vowelCount >= 1, consonantCount >= 2 {
                    print(result.joined())
                    return
                }
            }
        }
        
        for i in index..<target.count {
            combination(target: target, targetCount: targetCount, index: i + 1, temp: temp + [target[i]])            
        }
    }
    
    combination(target: array, targetCount: l, index: 0, temp: [])
}
