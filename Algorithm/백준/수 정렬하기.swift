//
//  수 정렬하기.swift
//  Algorithm
//  - 구현, 정렬
//  Created by 전소영 on 2021/04/15.
//

import Foundation

//선택정렬
func selctionSorting() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let testCases = readline[0]
    var sortingArray: [Int] = []
    var temp = 0
    
    for _ in 0..<testCases {
        let readline = readLine()!.split(separator: " ").map{ Int($0)! }
        sortingArray.append(readline[0])
    }
    
    for i in 0..<sortingArray.count {
        for j in i+1..<sortingArray.count {
            if sortingArray[i] > sortingArray[j] {
                temp = sortingArray[i]
                sortingArray[i] = sortingArray[j]
                sortingArray[j] = temp
            }
        }
    }
    
    for element in sortingArray {
      print(element)
    }
}

//삽입정렬
func insertionSorting(){
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let testCases = readline[0]
    var sortingArray: [Int] = []
    var temp = 0
    
    for _ in 0..<testCases {
        let readline = readLine()!.split(separator: " ").map{ Int($0)! }
        sortingArray.append(readline[0])
    }
    
    var a = sortingArray
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    
    for element in a {
      print(element)
    }
}

