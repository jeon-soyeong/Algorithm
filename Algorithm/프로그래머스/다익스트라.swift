//
//  다익스트라.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/20.
//

import Foundation

let graphs: [String: [String: Int]] = ["A": ["B": 5, "C": 0],
                                       "B": ["D": 15, "E": 20],
                                       "C": ["D": 30, "E": 35],
                                       "D": ["F": 20],
                                       "E": ["F": 10],
                                       "F": [:]
                                      ]

var costs = ["B": 5,
             "C": 0,
             "D": Int.max,
             "E": Int.max,
             "F": Int.max
            ]

var parents = ["B": "A",
                "C": "A",
                "D": "",
                "E": "",
                "F": ""
              ]

var processedNodes: [String] = []
// 아직 처리 하지 않은 정점 중 더 싼 것이 있으면 새로운 정점으로
func findLowestCostNode(costs: [String: Int])-> String {
    var lowest_cost = Int.max
    var lowest_node = ""
    
    for (key, value) in costs {
        if value < lowest_cost && !processedNodes.contains(key) {
            lowest_cost = value
            lowest_node = key
        }
    }
    
    return lowest_node
}

// 가장 싼 가격을 찾아서 가격 갱신 & 부모갱신 -> 해당 점점을 처리했다는 사실 기록
// 모든 정점을 처리할때 까지 반복
var node = findLowestCostNode(costs: costs)

func dijkstra() {
    while node != "" {
        let cost = costs[node] // c -> 0
        let neighbors = graphs[node]
        
        for (key, value) in neighbors! { // "C": ["D": 30, "E": 35],
            let new_cost = cost! + value
            if new_cost < costs[key]! {
                costs[key] = new_cost
                parents[key] = node
            }
        }
        
        processedNodes.append(node)
        node = findLowestCostNode(costs: costs)
    }
    
    print(parents)
    //["B": "A", "F": "E", "C": "A", "D": "B", "E": "B"]
    print(costs)
    //["B": 5, "F": 35, "C": 0, "D": 20, "E": 25]
    
    
    //루트로 만들기
    var routes: [String] = []
    routes.append("F")
    
    var parent = parents["F"]
    routes.append(parent!)
    
    while parent != "A" {
        parent = parents[parent!]
        routes.append(parent!)
    }
    
    
    // 최단 경로
    for (index, item) in routes.reversed().enumerated() {
        //마지막 F프린트 하고 \n하고 밑의 가격출력위함
        if index == routes.count - 1 {
            print(item)
        } else {
            print(item, terminator:"->")
        }
    }
    //A->B->E->F
    
    
    // 가격
    print(costs["F"]!)
    //35
}
