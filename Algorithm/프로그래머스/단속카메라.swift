//
//  단속카메라.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/11/05.
//

import Foundation

func solution(_ routes: [[Int]]) -> Int {
    var count = 0
    var sortedRoutes = routes.sorted { $0[1] < $1[1] }
    
    while !sortedRoutes.isEmpty {
        count += 1
        let cameraLocation = sortedRoutes.first![1]
        sortedRoutes.removeFirst()
        sortedRoutes = sortedRoutes.filter { $0[0] > cameraLocation }
    }

    return count
}
