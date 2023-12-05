//
//  미로 탈출 명령어.swift
//  Algorithm
//
//  Created by 전소영 on 2023/06/19.
//

import Foundation

func solution150365(_ n: Int, _ m: Int, _ x: Int, _ y: Int, _ r: Int, _ c: Int, _ k: Int) -> String {
//    var answer = ""
//    var startX = x
//    var startY = y
//    let distance = abs(r - x) + abs(c - y)
//
//    if distance > k || (k - distance) % 2 != 0 {
//        return "impossible"
//    }
//
//    // dlru 순으로
//    var down = max(r - x, 0)
//    var left = max(y - c, 0)
//    var right = max(c - y, 0)
//    var up = max(x - r, 0)
//    var pair = (k - distance) / 2
//
//    for _ in 0..<k {
//        if (down != 0 || pair != 0), startX < n {
//            if down != 0 {
//                down -= 1
//            } else {
//                pair -= 1
//                up += 1
//            }
//            startX += 1
//            answer += "d"
//        } else if (left != 0 || pair != 0), startY > 1 {
//            if left != 0 {
//                left -= 1
//            } else {
//                pair -= 1
//                right += 1
//            }
//            startY -= 1
//            answer += "l"
//        } else if (right != 0 || pair != 0), startY < m {
//            if right != 0 {
//                right -= 1
//            } else {
//                pair -= 1
//                left += 1
//            }
//            startY += 1
//            answer += "r"
//        } else {
//            if up != 0 {
//                up -= 1
//            } else {
//                pair -= 1
//                down += 1
//            }
//            startX -= 1
//            answer += "u"
//        }
//    }
//
//    return answer

    var answer = "impossible"

    func move(_ x: Int, _ y: Int, _ path: String) {
        if answer != "impossible" {
            return
        }

        let remain = k - path.count
        let distance = abs(r - x) + abs(c - y)

        if remain < distance || (remain - distance) % 2 != 0 {
            return
        }

        if remain == 0 {
            answer = path
            return
        }

        if x < n {
            move(x + 1, y, path + "d")
        }

        if 1 < y {
            move(x, y - 1, path + "l")
        }

        if y < m {
            move(x, y + 1, path + "r")
        }

        if 1 < x {
            move(x - 1, y, path + "u")
        }
    }

    move(x, y, "")
    return answer
}
