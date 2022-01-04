//
//  캐시.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/03.
//

import Foundation

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var caches: [String] = []
    var time: Int = 0
    let cities = cities.map { $0.lowercased() }
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for i in 0..<cities.count {
        if !caches.contains(cities[i]) {
            if caches.count < cacheSize {
                caches.append(cities[i])
            } else {
                caches.removeFirst()
                caches.append(cities[i])
            }
            time += 5
        } else {
            if let cityIndex = caches.firstIndex(of: cities[i]) {
                let temp = caches.remove(at: cityIndex)
                caches.append(temp)
                time += 1
            }
        }
    }
    
    return time
}
