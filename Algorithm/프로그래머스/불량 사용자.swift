//
//  불량 사용자.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/17.
//

import Foundation

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
    var resultArray: [[Int]] = Array(repeating: [], count: banned_id.count)
    var resultSet = Set<[Int]>()
    
    for (index, banID) in banned_id.enumerated() {
        for (i, userID) in user_id.enumerated() {
            if banID.count != userID.count {
                continue
            }
            
            var tempBanId = banID.map { String($0) }
            let tempUserId = userID.map { String($0) }
            let starIndex = banID.enumerated().filter { $1 == "*" }.map { $0.offset }
            
            starIndex.forEach {
                tempBanId[$0] = tempUserId[$0]
            }
            
            if tempUserId.joined() == tempBanId.joined() {
                resultArray[index].append(i)
            }
        }
    }
   
    func combinate(i: Int, select: [Int]) {
        if select.count == banned_id.count {
            resultSet.update(with: select.sorted())
            return
        }
        
        var select = select
        let array = resultArray[i]
        
        for n in array {
            if select.contains(n) {
                continue
            }
            select.append(n)
            combinate(i: i + 1, select: select)
            select.removeLast()
        }
    }
    
    combinate(i: 0, select: [])
    
    return resultSet.count
}
