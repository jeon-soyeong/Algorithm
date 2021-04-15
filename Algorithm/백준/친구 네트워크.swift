//
//  친구 네트워크.swift
//  Algorithm
//  - 자료 구조, 분리 집합, 해시를 사용한 집합과 맵
//  Created by 전소영 on 2021/04/08.
//  해설 참조

import Foundation

var parent: [String:String] = [:]
var number: [String:Int] = [:]
var root_x = ""
var root_y = ""

// Root node를 찾아주는 함수
func find(x: String) -> String {
    if x == parent[x] {
        return x
    } else {
        //내가 root가 아니면 부모의 root를 찾아가는 과정
        root_x = find(x: parent[x]!)
        parent[x] = root_x
        return parent[x]!

    }
}

// y의 Root 노드가 x의 Root 노드와 같지 않으면
// y의 Root 노드가 x의 Root 노드의 자식이 되도록 하는 함수
func union(x: String, y: String) {
    root_x = find(x: x)
    root_y = find(x: y)
    
    if root_x != root_y {
        parent[root_y] = root_x
        number[root_x]! += number[root_y]!
        print("parent.: \(parent)")
        print("number: \(number)")
    }
}

func solution() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let testCases = readline[0]
    
    for _ in 0..<testCases {
        parent = [:]
        number = [:]
        print("testCases: \(testCases)")
        let readline = readLine()!.split(separator: " ").map{ Int($0)! }
        let f = readline[0]
        
        for _ in 0..<f {
            print("f: \(f)")
            let readline = readLine()!.split(separator: " ").map{ String($0) }
            let firstName = readline[0]
            let secondName = readline[1]
           
            if !(parent.keys.contains(firstName)) {
                parent[firstName] = firstName
                number[firstName] = 1
            }
            
            if !(parent.keys.contains(secondName)) {
                parent[secondName] = secondName
                number[secondName] = 1
            }
            
            print("parent: \(parent)")

            union(x: firstName, y: secondName)
            print(number[find(x: firstName)])
        }
    }
}
