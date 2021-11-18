//
//  베스트 앨범.swift
//  Algorithm
//  - 해시
//  Created by 전소영 on 2021/11/17.
//

import Foundation

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var indexDictionary: [String: [Int]] = [:]
    var sumDictionary: [String: [Int]] = [:]
    var resultArray: [Int] = []
    
    for i in 0..<genres.count {
        if indexDictionary[genres[i]] != nil {
            indexDictionary[genres[i]]!.append(i)
        } else {
            indexDictionary[genres[i]] = [i]
        }
    }
    
    for dictionary in indexDictionary {
        indexDictionary[dictionary.key] = dictionary.value.sorted {
            plays[$0] > plays[$1]
        }
    }
    
    sumDictionary = indexDictionary
    
    for dictionary in indexDictionary {
        var sum = 0
        for value in dictionary.value {
            sum += plays[value]
        }
        sumDictionary[dictionary.key] = [sum]
    }
    
    let sortedSumDictionary = sumDictionary.sorted {
        $0.value.first! > $1.value.first!
    }
    
    for i in 0..<sortedSumDictionary.count {
        if let indexArray = indexDictionary[sortedSumDictionary[i].key] {
            resultArray.append((indexArray[0]))
            if indexArray.count > 1 {
                resultArray.append((indexArray[1]))
            }
        }
    }
    
    return resultArray
}
