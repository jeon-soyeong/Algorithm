//
//  전화번호 목록.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/17.
//

import Foundation

//phone_book                            return
//["97674223", "1195524421", "119"]     false
//["123","456","789"]                   true
//["12","123","1235","567","88"]        false

func solution42577(_ phone_book: [String]) -> Bool {
    var phoneBook = phone_book
    phoneBook.sort { $0.count < $1.count }
        
    for i in 0..<phoneBook.count - 1 {
        for j in i + 1..<phoneBook.count {
            if phoneBook[j].hasPrefix(phoneBook[i]) {
                return false
            }
        }
    }
    
    return true
}
