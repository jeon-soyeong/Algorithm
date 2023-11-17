//
//  개인정보 수집 유효기간.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/17.
//

import Foundation

func solution150370(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer: [Int] = []
    var termDictionary: [String: Int] = [:]
    
    for term in terms {
        let t = term.split(separator: " ").map { String($0) }
        termDictionary[t[0]] = Int(t[1])!
    }
    
    for i in 0..<privacies.count {
        let t = today.split(separator: ".").map { Int(String($0))! }
        let (tYear, tMonth, tday) = (t[0], t[1], t[2])
        let p = privacies[i].split(separator: " ").map { String($0) }
        let date = p[0].split(separator: ".").map { Int(String($0))! }
        var (year, month, day) = (date[0], date[1], date[2])
        let spec = p[1]
        let term = termDictionary[spec]!
        
        month += term
        
        if month > 12 {
            year += month / 12
            month %= 12
        }
        
        if month == 0 {
            year -= 1
            month = 12
        }
        
        if day == 01 {
            month -= 1
            day = 28
        } else {
            day -= 1
        }
        
        if tYear * 365 + tMonth * 28 + tday > year * 365 + month * 28 + day {
            answer.append(i + 1)
        }
    }
    
    return answer
}
