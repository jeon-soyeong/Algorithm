//
//  캐시.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/03.
//

import Foundation

func cache(_ cacheSize: Int, _ cities: [String]) -> Int {
    var cache: [String] = []
    var time = 0

    if cacheSize == 0 {
        time = cities.count * 5
        return time
    }

    for city in cities {
        let lowerCity = city.lowercased()

        if cache.contains(lowerCity) {
            guard let cityIndex = cache.firstIndex(of: lowerCity) else {
                return 0
            }
            cache.remove(at: cityIndex)
            time += 1
        } else {
            if cacheSize == cache.count {
                cache.removeLast()
            }
            time += 5
        }
        cache.insert(lowerCity, at: 0)
    }

    return time
}
