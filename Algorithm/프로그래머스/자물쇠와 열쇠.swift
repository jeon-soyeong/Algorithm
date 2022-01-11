//
//  자물쇠와 열쇠.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/11.
//

import Foundation

func solution(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    let m = key.count
    let n = lock.count
    var keyList = key
    var newArray: [[Int]] = []
    var newKey: [[Int]] = []
    (1...3 * n).forEach { _ in newArray.append([Int](repeating: 0, count: 3 * n)) }
    (1...m).forEach { _ in newKey.append([Int](repeating: 0, count: m)) }
    
    func rotate(key: [[Int]]) -> [[Int]] {
        var tempKey = newKey
        for i in 0..<m {
            for j in 0..<m {
                tempKey[i][j] = key[m - 1 - j][i]
            }
        }
        
        return tempKey
    }
    
    func fetchNewArray() {
        for i in n..<2 * n {
            for j in n..<2 * n {
                newArray[i][j] = lock[i - n][j - n]
            }
        }
    }
    
    
    func checkKey(lock: [[Int]]) -> Bool {
        for i in n..<2 * n {
            for j in n..<2 * n {
                if lock[i][j] == 0 || lock[i][j] == 2 {
                    return false
                }
            }
        }
        
        return true
    }
   
    func addKey(array: inout [[Int]], row: Int, col: Int) {
        for i in 0..<m {
            for j in 0..<m {
                array[i + row][j + col] += keyList[i % m][j % m]
            }
        }
    }
    
    fetchNewArray()
 
    for _ in 1...4 {
        keyList = rotate(key: keyList)
        for i in n - m + 1..<2 * n {
            for j in n - m + 1..<2 * n {
                var array = newArray
                addKey(array: &array, row: i, col: j)

                if checkKey(lock: array) {
                    return true
                }
            }
        }
    }
    
    return false
}
