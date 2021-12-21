//
//  순열과 조합.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/21.
//

import Foundation

//combination([1,2,3,4,5], 3, 0, [])
func combination<T>(_ target: [T], _ targetCount: Int, _ index: Int, _ temp: [T]) {
    if temp.count == targetCount {
        print(temp)
        return
    }
    
//    print(tmp) -> 모든 조합시
    for i in index ..< target.count {
        combination(target, targetCount, i + 1, temp + [target[i]])
    }
}

//let letters = ["a", "b", "c"]
//permutation(letters, letters.count - 1)
func permutation<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)
    } else {
        var a = a
        permutation(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permutation(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

func factorial(_ num: Int) -> Int {
   if num <= 1 {
       return 1
   }
    
   return (num * factorial(num - 1))
}
