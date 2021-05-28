//
//  Z.swift
//  Algorithm
// - 분할 정복, 재귀
//  Created by 전소영 on 2021/04/21.
//

import Foundation

var quadrantValue = 0
var n = 0
var r = 0
var c = 0

func Z() {
    let readline = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    n = readline[0]
    r = readline[1]
    c = readline[2]
    var total = 0
    
    while n > 0 {
        let quadrantValue = find(n: n, r: r, c: c)
       
        let powValue = pow(2.0, n - 1)
        let powIntValue = NSDecimalNumber(decimal: powValue).intValue
        
        total += (quadrantValue - 1) * (powIntValue * powIntValue)
        reallocate(rValue: r, cValue: c)
    }
    print(total)
}

func find(n: Int, r: Int, c: Int) -> Int {
    let powValue = pow(2.0, n - 1)
    let powIntValue = NSDecimalNumber(decimal: powValue).intValue
    
    if r < powIntValue && c < powIntValue {
        quadrantValue = 1
    } else if r < powIntValue && c >= powIntValue {
        quadrantValue = 2
    } else if r >= powIntValue && c < powIntValue {
        quadrantValue = 3
    } else if r >= powIntValue && c >= powIntValue {
        quadrantValue = 4
    }
    return quadrantValue
}

func reallocate(rValue: Int, cValue: Int) {
    r = rValue
    c = cValue
    switch quadrantValue {
    case 2:
        c -= (2 * (n - 1))
        break
    case 3:
        r -= (2 * (n - 1))
        break
    case 4:
        c -= (2 * (n - 1))
        r -= (2 * (n - 1))
        break
    default:
        break
    }
    n -= 1
}
