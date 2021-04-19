//
//  소트인사이드.swift
//  Algorithm
//  - 문자열, 정렬
//  Created by 전소영 on 2021/04/19.
//

import Foundation

func sortInside() {
    let readline = readLine()!.split(separator: " ").map{ ($0) }
    let number = readline[0]
    var numberArray = Array(number)
    
    numberArray.sort(by: >)
    for element in numberArray {
        print(element, terminator: "")
    }
}
