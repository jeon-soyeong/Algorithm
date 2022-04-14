//
//  교점에 별 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/14.
//

import Foundation

func solution(_ line: [[Int]]) -> [String] {
    var starLocationArray: [(x: Int, y: Int)] = []
    var maxX = Int.min
    var minX = Int.max
    var maxY = Int.min
    var minY = Int.max
    
    for i in 0..<line.count - 1 {
        for j in i + 1..<line.count {
            let abe = line[i]
            let cdf = line[j]
            let adbc = abe[0] * cdf[1] - abe[1] * cdf[0]
            let bfed = abe[1] * cdf[2] - abe[2] * cdf[1]
            let ecaf = abe[2] * cdf[0] - abe[0] * cdf[2]
            
            if adbc != 0 && bfed % adbc == 0 && ecaf % adbc == 0 {
                starLocationArray.append((bfed / adbc, ecaf / adbc))
             
                maxX = max(starLocationArray.last!.x, maxX)
                minX = min (starLocationArray.last!.x, minX)
                maxY = max(starLocationArray.last!.y, maxY)
                minY = min(starLocationArray.last!.y, minY)
            }
        }
    }
    
    var locationArray = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    
    for starLocation in starLocationArray {
        locationArray[starLocation.y - minY][starLocation.x - minX] = "*"
    }
    
    var result: [String] = []
    for locationArray in locationArray.reversed() {
        result.append(locationArray.reduce("",  +))
    }
    
    return result
}
