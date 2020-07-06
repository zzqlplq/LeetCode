//
//  main.swift
//  LongestCommonPrefix
//
//  Created by 郑志强 on 2020/7/6.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
 
    guard strs.count > 1 else {
        return strs.first ?? ""
    }
    
    var index = 0
    var prefix = ""

    while true {
        let commonPrefix = strs.first!.prefix(index)
        for i in 1 ..< strs.count {
            let str = strs[i]
            if index > str.count ||  commonPrefix != str.prefix(index) {
                return prefix
            }
        }
        prefix = String(commonPrefix)
        index = index + 1
    }
}


let strs = ["a"]
print(longestCommonPrefix2(strs))



func longestCommonPrefix1(_ strs: [String]) -> String {

    guard !strs.isEmpty else {
        return ""
    }
    
    var prefix = ""
    
    for i in 0 ..< INT_MAX {
        
        let commonPrefix = strs.first!.prefix(Int(i))
        for j in 0 ..< strs.count {
            let str = strs[j]
            if i > str.count ||  commonPrefix != str.prefix(Int(i)) {
                return prefix
            }
        }
        prefix = String(commonPrefix)
    }
    
    return prefix
}



func longestCommonPrefix2(_ strs: [String]) -> String {
    
    guard !strs.isEmpty else { return "" }
    
    let sorted = strs.sorted()
    var prefix = ""
    
    let first = sorted.first!
    let last = sorted.last!
    
    for i in 0 ... first.count {
        if first.prefix(i) != last.prefix(i) {
            return prefix
        }
        prefix = String(first.prefix(i))
    }
    return prefix
}




class TrieNode<T: Hashable> {

    var value: T?
    
    weak var parent: TrieNode?
    
    var children = [T : TrieNode]()
    
    var isTerminating = false
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(value: child, parent: self)
    }
    
    var description: String {
        return "[value: \(value.debugDescription), parent:\(parent.debugDescription), children:\(children.debugDescription), isEnd:\(isTerminating.description)]"
    }
}


class Trie {
    
    typealias Node = TrieNode<Character>
    let root: Node

    init() {
        root = Node()
    }
}


extension Trie {
    
    func insert(word: String) {
        
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        let chs = Array(word.lowercased())
        
        var currentIndex = 0
        
        while currentIndex < chs.count {
            
            let ch = chs[currentIndex]
            
            if let child = currentNode.children[ch] {
                currentNode = child
            } else {
                currentNode.add(child: ch)
                currentNode = currentNode.children[ch]!
            }
            currentIndex += 1
            
            if currentIndex == chs.count {
                currentNode.isTerminating = true
            }
        }
    }
    
    
    func contains(word: String) -> Bool {
        
        guard !word.isEmpty else { return false }
        
        var currentNode = root
        
        let chs = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < chs.count {
            
            if let child = currentNode.children[chs[currentIndex]] {
                currentIndex += 1
                currentNode = child
            }
        }
        
        if currentIndex == chs.count && currentNode.isTerminating {
           return true
        } else {
           return false
        }
    }
    
    
    func log(node: Node? = nil) {
        
        guard node != nil else { return }
        
        for (key, value) in node!.children {
            print("key: \(key.description) : value: \(value.description)")
            log(node: value)
        }
    }
}


let trie = Trie()

let str1 = "string"
let str2 = "str"
let str3 = "sting"
let str4 = "se"
let str5 = "f"


trie.insert(word: str1)
trie.insert(word: str2)
trie.insert(word: str3)
trie.insert(word: str4)
trie.insert(word: str5)

trie.log(node:trie.root)

print(trie.contains(word: "str"))
