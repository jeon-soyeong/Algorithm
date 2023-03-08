//
//  이모티콘 할인행사.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/08.
//

import Foundation
// users                        emoticons        result
// [[40, 10000], [25, 10000]]    [7000, 9000]    [1, 5400]
// [[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]]
// [1300, 1500, 1600, 4900]
// [4, 13860]

func solution150368(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
    let discountRates = [40, 30, 20, 10]
    let users = users.sorted(by: { $0[0] > $1[0] })
    var emoticonPlusUsersTotalCount = -1
    var emoticonTotalSales = -1
    
    func dfs(array: [Int], discountRates: [Int]) {
        if array.count == emoticons.count {
            getEmoticonPerformance(array: array)
            return
        }
        
        for discountRate in discountRates {
            dfs(array: array + [discountRate], discountRates: discountRates)
        }
    }

    func getEmoticonPerformance(array: [Int]) {
        var emoticonPlusUsersCount = 0
        var emoticonSales = 0
        
        for i in 0..<users.count {
            var sum = 0
            for j in 0..<array.count {
                if users[i][0] <= array[j] {
                    sum += Int(Double(emoticons[j]) * Double(100 - array[j]) / 100)
                }
            }
            
            if sum >= users[i][1] {
                emoticonPlusUsersCount += 1
            } else {
                emoticonSales += sum
            }
        }
        
        if emoticonPlusUsersTotalCount < emoticonPlusUsersCount {
            emoticonPlusUsersTotalCount = emoticonPlusUsersCount
            emoticonTotalSales = emoticonSales
        } else if emoticonPlusUsersTotalCount == emoticonPlusUsersCount {
            emoticonTotalSales = emoticonTotalSales > emoticonSales ? emoticonTotalSales : emoticonSales
        }
    }
    
    dfs(array: [], discountRates: discountRates.filter { $0 >= users.last![0] })
    
    return [emoticonPlusUsersTotalCount, emoticonTotalSales]
}
