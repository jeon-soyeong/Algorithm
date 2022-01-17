//
//  보석 쇼핑.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/13.
//

import Foundation

func solution(_ gems: [String]) -> [Int] {
    let gemsSetCount = Set<String>(gems).count
    var gemsDictionary: [String: Int] = [gems[0]: 1]
    var answer = (start: 0, end: gems.count - 1)
    var lPoint = 0
    var rPoint = 0
    
    while (lPoint < gems.count) && (rPoint < gems.count) {
        if gemsDictionary.count == gemsSetCount {
            if rPoint - lPoint < answer.end - answer.start {
                answer.start = lPoint
                answer.end = rPoint
            } else if rPoint - lPoint == answer.end - answer.start {
                if lPoint < answer.start {
                    answer.start = lPoint
                    answer.end = rPoint
                }
            }
            
            if let value = gemsDictionary[gems[lPoint]] {
                if value - 1 == 0 {
                    gemsDictionary.removeValue(forKey: gems[lPoint])
                } else {
                    gemsDictionary.updateValue(value - 1, forKey: gems[lPoint])
                }
            }
            
            lPoint += 1
        } else {
            rPoint += 1
            if rPoint >= gems.count {
                continue
            }
            
            if let value = gemsDictionary[gems[rPoint]] {
                gemsDictionary.updateValue(value + 1, forKey: gems[rPoint])
            } else {
                gemsDictionary.updateValue(1, forKey: gems[rPoint])
            }
        }
    }
    
    return [answer.start + 1, answer.end + 1]
}
