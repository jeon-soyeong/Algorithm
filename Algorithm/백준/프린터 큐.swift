//
//  프린터 큐.swift
//  Algorithm
//  - 구현, 자료 구조, 시뮬레이션, 큐
//  Created by 전소영 on 2021/03/30.
//

import Foundation
  
func printerQueue() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = readline[0]
    let m = readline[1]
    var importance = readLine()!.split(separator: " ").map{ Int($0)! }
    var indexArray: [Int] = []
    
    for i in 0..<importance.count {
        indexArray.append(i)
    }
     
    let target = indexArray[m]
    var order = 0
    
    print("n: \(n)")
    print("m: \(m)")
    print("importance: \(importance)")
    print("indexArray: \(indexArray)")
    
    while true {
        if importance[0] == importance.max()! {
            order += 1
            
            if indexArray[0] == target {
                print("order: \(order)")
                break
            } else {
                importance.removeFirst()
                indexArray.removeFirst()
            }
        } else {
            importance.append(importance.removeFirst())
            indexArray.append(indexArray.removeFirst())
        }
    }
}
