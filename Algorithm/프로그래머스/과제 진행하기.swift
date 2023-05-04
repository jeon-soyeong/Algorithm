//
//  과제 진행하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/04.
//

import Foundation
// [["music",    "12:20", "13:00"],
//  ["computer", "12:30", "14:10"],
//  ["science",  "12:40", "13:30"],
//  ["history",  "14:00", "14:30"]]

// ["science", "history", "computer", "music"]
func solution176962(_ plans: [[String]]) -> [String] {
    var tasks: [[String]] = []
    var answer: [String] = []
    var stack: [(String, Int)] = []
    
    for plan in plans {
        let startTime = plan[1].split(separator: ":")
        let hour = Int(startTime[0])!
        let minute = Int(startTime[1])!
        let task = [plan[0], String(hour * 60 + minute), String(hour * 60 + minute + Int(plan[2])!)]
        
        tasks.append(task)
    }
    
    tasks.sort(by: { Int($0[1])! < Int($1[1])! })
    
    for i in 0..<tasks.count - 1 {
        var remaining = Int(tasks[i + 1][1])! - Int(tasks[i][2])!
        
        if remaining < 0 {
            stack.append((tasks[i][0], Int(tasks[i][2])! - Int(tasks[i + 1][1])!))
        } else {
            answer.append(tasks[i][0])
        }
        
        while remaining > 0, !stack.isEmpty {
            let task = stack.removeLast()
            
            if remaining >= task.1 {
                answer.append(task.0)
                remaining -= task.1
            } else {
                stack.append((task.0, task.1 - remaining))
                remaining = 0
            }
        }
    }
    
    answer.append(tasks.last![0])
    
    while !stack.isEmpty {
        let subject = stack.removeLast()
        answer.append(subject.0)
    }
    
    return answer
}
