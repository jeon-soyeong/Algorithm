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

//퀵정렬
func quickSorting(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }

    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }

    return quickSorting(less) + equal + quickSorting(greater)
  }


//계수 정렬
func countSorting(_ array:[Int]) -> [Int] {
    let maxElement = array.max() ?? 0
    
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for element in array {
        countArray[element] += 1
    }
    
    for index in 1 ..< countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    var sortedArray = [Int](repeating: 0, count: array.count)
    for index in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[index]
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
    }
    
    return sortedArray
}
