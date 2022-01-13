//
//  표 편집.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/12.
//

import Foundation

class Node {
    var data: Int?
    var prev: Node?
    var next: Node?
    
    init(data: Int, prev: Node?, next: Node?) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?
    var cursor: Node?
    var isDeleted: [Bool] = []
    
    func append(data: Int, isInitCursor: Bool) {
        let node = Node(data: data, prev: nil, next: nil)
        if isInitCursor { cursor = node }
        
        if head == nil {
            head = node
            tail = node
        } else {
            node.prev = tail
            tail?.next = node
            tail = node
        }
        
        isDeleted.append(false)
    }
    
    func remove() -> Node? {
        let deleteNode = cursor
        
        cursor?.next?.prev = cursor?.prev
        cursor?.prev?.next = cursor?.next
        cursor = deleteNode?.next == nil ? deleteNode?.prev : deleteNode?.next
        
        isDeleted[deleteNode!.data!] = true
        return deleteNode
    }
    
    func moveUp(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.prev
        }
    }
    
    func moveDown(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.next
        }
    }
    
    func restore(node: Node?) {
        node?.prev?.next = node
        node?.next?.prev = node
        isDeleted[node!.data!] = false
    }
}

func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    let table = LinkedList()
    var deleteStack:[Node?] = []
    
    for i in 0..<n { table.append(data: i, isInitCursor: i == k) }
    
    for command in cmd {
        let splitCommand = command.components(separatedBy: " ")
        switch splitCommand[0] {
        case "D":
            table.moveDown(to: Int(splitCommand[1])!)
        case "U":
            table.moveUp(to: Int(splitCommand[1])!)
        case "C":
            deleteStack.append(table.remove())
        case "Z":
            table.restore(node: deleteStack.removeLast())
        default:
            break
        }
    }
    
    return table.isDeleted.map { $0 ? "X" : "O" }.joined(separator: "")
}
