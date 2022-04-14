//
//  영어 끝말잇기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/13.
//

import Foundation

func solution(_ n: Int, _ words: [String]) -> [Int] {
    var wordsArray = Array(repeating: [String](), count: n)
    var answerArray = [0, 0]
    var count = 0
    
    for i in 0..<words.count {
        if count == wordsArray.count {
            count = 0
        }
        
        if count < n {
            if count == 0 {
                if let last = wordsArray[n - 1].last {
                    let lastCharactor = last.last
                    if words[i].first == lastCharactor {
                        var flag = true
                        for k in 0..<i {
                            if words[k] == words[i] {
                                flag = false
                                break
                            }
                        }
                        if flag {
                            wordsArray[count].append(words[i])
                        } else {
                            answerArray = [count + 1, wordsArray[count].count + 1]
                            break
                        }
                    } else {
                        answerArray = [count + 1, wordsArray[count].count + 1]
                        break
                    }
                } else {
                    wordsArray[count].append(words[i])
                }
            } else {
                if let last = wordsArray[count - 1].last {
                    let lastCharactor = last.last
                    if words[i].first == lastCharactor {
                        var flag = true
                        for k in 0..<i {
                            if words[k] == words[i] {
                                flag = false
                                break
                            }
                        }
                        if flag {
                            wordsArray[count].append(words[i])
                        } else {
                            answerArray = [count + 1, wordsArray[count].count + 1]
                            break
                        }
                    } else {
                        answerArray = [count + 1, wordsArray[count].count + 1]
                        break
                    }
                } else {
                    wordsArray[count].append(words[i])
                }
            }
        }
        count += 1
    }
    
    return answerArray
}
