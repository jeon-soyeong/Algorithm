//
//  호텔 대실.swift
//  Algorithm
//  - 누적합
//  Created by 전소영 on 2023/03/09.
//

import Foundation
//[["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]],  3
func solution155651(_ book_time: [[String]]) -> Int {
    let bookTime = book_time
    var answer = 0
    let hour = 60
    let cleaningTime = 10
    let maxTime = 24 * hour + 10
    var rooms = Array(repeating: 0, count: maxTime)

    func convertMinute(with time: String) -> Int {
        let times = time.split(separator: ":")
        let hour = Int(times[0])!
        let minute = Int(times[1])!

        return 60 * hour + minute
    }

    for book in bookTime {
        let inTime = book[0]
        let outTime = book[1]

        rooms[convertMinute(with: inTime)] += 1
        rooms[convertMinute(with: outTime) + cleaningTime] -= 1
    }

    for i in 1..<maxTime {
        rooms[i] += rooms[i - 1]
        answer = max(answer, rooms[i])
    }

    return answer
}
