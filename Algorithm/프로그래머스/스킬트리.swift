//
//  스킬트리.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/26.
//

import Foundation

func solution49993(_ skill: String, _ skill_trees: [String]) -> Int {
    var answer = 0
    
    for skilTree in skill_trees {
        let skills = skilTree.filter { skill.contains($0) }
        let skillPrefix = skill.prefix(skills.count)
        if skills == skillPrefix || skills.count == 0 {
            answer += 1
        }
    }
    
    return answer
}
