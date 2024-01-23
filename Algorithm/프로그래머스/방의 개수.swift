//
//  방의 개수.swift
//  Algorithm
//
//  Created by 전소영 on 2024/01/23.
//

import Foundation

func solution49190(_ arrows: [Int]) -> Int {
    let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
    let dy = [0, 1, 1, 1, 0, -1, -1, -1]
    var x = 0, y = 0
    var visitedNodes: Set<String> = []
    var visitedEdges: Set<String> = []
    var answer = 0

    visitedNodes.insert("\(x),\(y)")
    
    for arrow in arrows {
        for _ in 0..<2 { // 모래시계형 - 대각선 때문에 2칸씩 체크
            let nx = x + dx[arrow]
            let ny = y + dy[arrow]
            let edge = "\(x),\(y) to \(nx),\(ny)"
            let reversedEdge = "\(nx),\(ny) to \(x),\(y)"
            
            // 방문했던 노드지만 간선 경로가 겹치지 않는 경우
            if visitedNodes.contains("\(nx),\(ny)"), !visitedEdges.contains(edge) {
                answer += 1
            }
            
            visitedNodes.insert("\(nx),\(ny)")
            visitedEdges.insert(edge)
            visitedEdges.insert(reversedEdge)
            
            x = nx
            y = ny
        }
    }
    
    return answer
}
