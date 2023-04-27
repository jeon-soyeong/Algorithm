//
//  가사 검색.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/27.
//

import Foundation
//words                                                      queries                                          result
//["frodo", "front", "frost", "frozen", "frame", "kakao"]    ["fro??", "????o", "fr???", "fro???", "pro?"]    [3, 2, 4, 1, 0]
func solution60060(_ words: [String], _ queries: [String]) -> [Int] {
    var answer: [Int] = []
    var trieDictionary: [Int: Trie] = [:]
    var reversedTrieDictionary: [Int: Trie] = [:]
    
    for word in words {
        if trieDictionary[word.count] == nil {
            trieDictionary[word.count] = Trie()
            reversedTrieDictionary[word.count] = Trie()
        }
        
        trieDictionary[word.count]?.insert(word)
        reversedTrieDictionary[word.count]?.insert(String(word.reversed()))
    }
    
    for query in queries {
        if query.hasPrefix("?") {
            if let reversedTrie = reversedTrieDictionary[query.count] {
                answer.append(reversedTrie.search(String(query.reversed())))
            } else {
                answer.append(0)
            }
        } else {
            if let trie = trieDictionary[query.count] {
                answer.append(trie.search(query))
            } else {
                answer.append(0)
            }
        }
    }
    
    return answer
}

class Nodes {
    var value: String
    var count: Int = 0
    var child: [String: Nodes] = [:]
    
    init(value: String) {
        self.value = value
    }
}

class Trie {
    var root: Nodes
    
    init() {
        root = Nodes(value: "")
    }
    
    func insert(_ word: String) {
        var currentNode = self.root
        
        for w in word {
            currentNode.count += 1
            
            if currentNode.child[String(w)] == nil {
                currentNode.child[String(w)] = Nodes(value: String(w))
            }
            currentNode = currentNode.child[String(w)]!
        }
    }
    
    func search(_ query: String) -> Int {
        var currentNode = self.root
        
        for q in query {
            if String(q) == "?" {
                return currentNode.count
            }
            
            if currentNode.child[String(q)] == nil {
                return 0
            }
            currentNode = currentNode.child[String(q)]!
        }
        
        return currentNode.count
    }
}
