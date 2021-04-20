//
//  나이순정렬.swift
//  Algorithm
//  - 정렬
//  Created by 전소영 on 2021/04/20.
//

import Foundation

func ageSorting() {
    let count = Int(readLine()!)!
    var array = [(id: Int, age: Int, name: String)]()

    for i in 0..<count {
        let input = readLine()!.split(separator: " ")
        array.append((i, Int(input[0])!, input[1].description))
    }

    array.sort { (first, second) -> Bool in
        if first.age == second.age {
            return first.id < second.id
        }
        return first.age < second.age
    }

    for i in array {
        print(i.age, i.name)
    }
}
