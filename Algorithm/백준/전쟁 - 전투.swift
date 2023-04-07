//
//  전쟁 - 전투.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/07.
//

import Foundation
//5 5       130 65
//WBWWW
//WWWWW
//BBBBB
//BBBWW
//WWWWW
func solution1303() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = input[0]
    let height = input[1]
    var soldiers: [[Character]] = []
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    var soldierDictionary: [Character: Int] = ["W": 0, "B": 0]

    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    var count = 0
    
    for _ in 0..<height {
        soldiers.append(Array(readLine()!))
    }
    
    for i in 0..<height {
        for j in 0..<width {
            if !visited[i][j] {
                count = 0
                dfs(x: i, y: j, soldier: soldiers[i][j])
                soldierDictionary[soldiers[i][j]]! += count * count
            }
        }
    }
    
    func dfs(x: Int, y: Int, soldier: Character) {
        visited[x][y] = true
        count += 1
        
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<height ~= nx, 0..<width ~= ny, !visited[nx][ny], soldiers[nx][ny] == soldier {
                dfs(x: nx, y: ny, soldier: soldier)
            }
        }
    }
    
    print(soldierDictionary["W"]!, soldierDictionary["B"]!)
}
