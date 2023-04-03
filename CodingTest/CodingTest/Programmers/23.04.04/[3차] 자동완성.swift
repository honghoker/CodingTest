//  [3차] 자동완성.swift
//  https://school.programmers.co.kr/learn/courses/30/lessons/17685
//  Created by 홍은표 on 2023/04/04.

import Foundation

class TrieNode {
    var children = [Character: TrieNode]()
    var count = 0
}

class Trie {
    private let root = TrieNode()
    
    func insert(_ word: String) {
        var currentNode = root
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                let newNode = TrieNode()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
            currentNode.count += 1
        }
    }
    
    func getCount(_ word: String) -> Int {
        var currentNode = root
        for char in word {
            guard let node = currentNode.children[char] else { return 0 }
            currentNode = node
        }
        return currentNode.count
    }
}

func solution(_ words:[String]) -> Int {
    var answer = 0
    let trie = Trie()
    words.forEach { trie.insert($0) }
    
    for word in words {
        for i in 1...word.count {
            let subWord = String(word.prefix(i))
            let count = trie.getCount(subWord)
            if count == 1 {
                answer += i; break
            } else if i == word.count {
                answer += i
            }
        }
    }
    
    return answer
}
