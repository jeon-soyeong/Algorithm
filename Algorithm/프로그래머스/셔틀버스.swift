//
//  셔틀버스.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/12.
//

import Foundation

func solution(_ n: Int, _ t: Int, _ m: Int, _ timetable: [String]) -> String {
    var times: [Int] = timetable.map { Int($0.split(separator: ":")[0])! * 60
        + Int($0.split(separator: ":")[1])! }.sorted(by:<)
    var time = 540
    var people: Int = 0
    var last: Int = time
    var hour: String, minute: String = ""
    
    for _ in 0..<n {
        people = m

        for _ in 0..<m {
            if times.isEmpty || times.first! > time {
                break
            }
            last = times.removeFirst()
            people -= 1
        }

        time += t
    }
    
    time = people == 0 ? last - 1 : time - t
    hour = time / 60  < 10 ? "0\(time / 60)" : "\(time / 60)"
    minute = time % 60 < 10 ? "0\(time % 60)" : "\(time % 60)"
    
    return hour + ":" + minute
}
