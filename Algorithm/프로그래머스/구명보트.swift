//
//  구명보트.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/04/09.
//

import Foundation

func solution(people: [Int], limit: Int) -> Int {
    var answer = 0
    var peopleArray = people
    peopleArray.sort(by: >)
    print(peopleArray)
    
    for _ in 0..<peopleArray.count {
        if peopleArray[0] + peopleArray.last! <= limit {
            peopleArray.remove(at: 0)
            if peopleArray.isEmpty == false {
                peopleArray.removeLast()
            }
        } else {
            peopleArray.remove(at: 0)
        }
        answer += 1
        if peopleArray.isEmpty == true {
            break
        }
    }
    print("answer: \(answer)")
    return answer
}
