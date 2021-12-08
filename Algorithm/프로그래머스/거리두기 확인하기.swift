//
//  거리두기 확인하기.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/08.
//

import Foundation

func solution(_ places: [[String]]) -> [Int] {
    var result: [Int] = []
    
    for place in places {
        var students: [(Int,Int)] = []
        let p = place.map { $0.map { String($0) } }
        
        for i in 0..<5 {
            for j in 0..<5 {
                if checkP(p,i,j) {
                    students.append((i,j))
                }
            }
        }
    
        var val = 1
        
        if !students.isEmpty {
            for i in 0..<students.count - 1 {
                for j in i + 1..<students.count {
                    if getDistance(students[i], students[j]) == 2 {
                        if !checkX(p, students[i], students[j]) {
                            val = 0
                            break
                        }
                    } else if getDistance(students[i], students[j]) == 1 {
                        val = 0
                        break
                    }
                }
            }
        }
    
        result.append(val)
    }
    
    return result
}

func getDistance(_ x: (Int,Int), _ y: (Int,Int)) -> Int {
    return abs(x.0 - y.0) + abs(x.1 - y.1)
}

func checkP(_ arr: [[String]], _ row: Int, _ col: Int) -> Bool {
    return arr[row][col] == "P"
}

func checkX(_ arr: [[String]], _ x: (Int,Int), _ y: (Int,Int)) -> Bool {
    if x.0 == y.0 {
        for i in x.1 + 1..<y.1 {
            if arr[x.0][i] != "X" {
                return false
            }
        }
    } else if x.1 == y.1 {
        for i in x.0 + 1..<y.0 {
            if arr[i][x.1] != "X" {
                return false
            }
        }
    } else {
        if arr[x.0][y.1] != "X" || arr[y.0][x.1] != "X" {
            return false
        }
    }
    
    return true
}
