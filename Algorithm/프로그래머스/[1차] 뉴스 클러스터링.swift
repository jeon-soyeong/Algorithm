//
//  [1차] 뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 전소영 on 2023/06/28.
//

import Foundation
//str1          str2            answer
//FRANCE        french          16384
//handshake     shake hands     65536
//aa1+aa2       AAAA12          43690
//E=M*C^2       e=m*c^2         65536
func solution17677(_ str1: String, _ str2: String) -> Int {
    let string1 = str1.lowercased()
    let string2 = str2.lowercased()
    
    func createElementArray(_ str: String) -> [String] {
        let str = str.map { String($0) }
        var elements: [String] = []
        for i in 0..<str.count - 1 {
            if "a"..."z" ~= str[i], "a"..."z" ~= str[i + 1] {
                elements.append(str[i] + str[i + 1])
            }
        }
        return elements
    }

    func createIntersection(_ str1: [String], _ str2: [String]) -> [String] {
        var result: [String] = []
        
        var temp = str2
        str1.forEach {
            if let index = temp.firstIndex(of: $0) {
                temp.remove(at: index)
                result.append($0)
            }
        }
        
        return result
    }

    func createUnion(_ str1: [String], _ str2: [String]) -> [String] {
        var result: [String] = []
        
        var temp = str2
        str1.forEach {
            if let index = temp.firstIndex(of: $0) {
                temp.remove(at: index)
            }
        }
        result.append(contentsOf: temp)
        result.append(contentsOf: str1)
        
        return result
    }
    
    let strings1 = createElementArray(string1)
    let strings2 = createElementArray(string2)
    let intersection: [String] = createIntersection(strings1, strings2)
    let union: [String] = createUnion(strings1, strings2)
    
    if intersection.isEmpty, union.isEmpty {
        return 65536
    }
    
    return Int(trunc(((Double(intersection.count) / Double(union.count)) * 65536)))
}
