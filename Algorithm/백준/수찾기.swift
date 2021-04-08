//
//  수찾기.swift
//  Algorithm
//  - 이분 탐색
//  Created by 전소영 on 2021/04/07.
//

import Foundation

func findNumber() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = readline[0]
    var firstArray = readLine()!.split(separator: " ").map{ Int($0)! }
    firstArray.sort()
    
    let m = readLine()!
    let secondArray = readLine()!.split(separator: " ").map{ Int($0)! }
    /* 시간 초과 */
//    var flag = false
//    for i in 0..<secondArray.count {
//        for j in 0..<firstArray.count {
//            if secondArray[i] == firstArray[j] {
//                flag = true
//                break
//            } else {
//                flag = false
//            }
//        }
//        if flag == true {
//            print("1")
//        } else {
//            print("0")
//        }
//    }
    for item in secondArray {
        print(binarySearch(arr: firstArray, target: item))
    }
    
}

//이분 탐색 이용해야 함
func binarySearch(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    var mid = (start + end) / 2
        
    while end >= start {
        if arr[mid] == target {
            return 1
        } else if arr[mid] >= target {
            end = mid - 1
        } else {
            start = mid + 1
        }
        mid = (start + end) / 2
    }
    return 0
}
