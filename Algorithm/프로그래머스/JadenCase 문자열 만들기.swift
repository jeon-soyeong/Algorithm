//
//  JadenCase 문자열 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/13.
//

import Foundation

func solution12951(_ s: String) -> String {
    let words = s.components(separatedBy: " ")
    var answer = ""
    
    for i in 0..<words.count {
        var temp = 0
        for j in words[i] {
            if temp == 0  {
                answer += String(j.uppercased())
            } else {
                answer += String(j.lowercased())
            }
            temp += 1
        }
        if i < words.count - 1 {
            answer += " "
        }
    }
    
    return answer
   
//    let words = s.components(separatedBy: " ")
//    var charaters = Array(repeating: [String](), count: words.count)
//    var answer = Array(repeating: String(), count: words.count)
//    for w in 0..<words.count {
//        charaters[w] = words[w].map{ String($0).lowercased() }
//        if charaters[w].isEmpty ==  false {
//        charaters[w][0] = charaters[w][0].uppercased()
//        }
//        answer[w] = charaters[w].joined(separator: "")
//    }
//
//    return answer.joined(separator: " ")
}
