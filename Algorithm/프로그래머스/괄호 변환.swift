//
//  괄호 변환.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/06.
//

import Foundation

func solution(_ p: String) -> String {
    if !p.isEmpty {
        var u = ""
        var count = 0
        
        for charactor in p {
            if charactor == "(" {
                count += 1
                u += "("
            } else {
                count -= 1
                u += ")"
            }
            
            if count == 0 {
                break
            }
        }
        
        let v = String(p.suffix(p.count - u.count))
        
        for charactor in u {
            if charactor == "(" {
                count += 1
            } else {
                count -= 1
            }
            
            if count < 0 {
                break
            }
        }
        
        let umap = u.map { String($0) }
        
        if count < 0 {
            u = ""
            for i in 0..<umap.count {
                if i == 0 || i == umap.count - 1 {
                    continue
                } else {
                    if umap[i] == "(" {
                        u += ")"
                    } else {
                        u += "("
                    }
                }
            }
           
            return "(\(solution(v)))\(u)"
        }
        
        return "\(u)\(solution(v))"
    }
    
    return ""
}
