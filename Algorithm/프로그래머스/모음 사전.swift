//
//  모음 사전.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/18.
//

import Foundation

func solutionVowelDictionary(_ word: String) -> Int {
    findVowelDictionary(nowWord: "", targetWord: word)
    return answer
}

let words: [String] = ["A", "E", "I", "O", "U"]
var flag: Bool = false
var answer: Int = 0
var count: Int = 0

func findVowelDictionary(nowWord: String, targetWord: String) {
    if nowWord == targetWord {
        flag = true
        answer = count
        return
    }
    
    if flag || answer != 0 || nowWord.count == 5 {
        return
    }
    
    for i in 0..<5 {
        count += 1
        findVowelDictionary(nowWord: nowWord + words[i], targetWord: targetWord)
    }
}
