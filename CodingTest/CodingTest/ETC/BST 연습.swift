// BST 연습
// Created by 홍은표 on 2022/10/02.

import Foundation

// 이진 탐색 트리 자체가 데이터를 비교해가면서 탐색을 하기 때문에, 비교가 가능한 데이터만 저장할 수 있게 Comparable 프로토콜을 채택한 제네릭으로 선언
class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(_ data: T) {
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        
        while true {
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node.init(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node.init(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if root == nil { return false }
        
        var currentNode = root
        while let node = currentNode {
            if node.data == data { return true }
            if node.data > data { currentNode = node.left }
            else { currentNode = node.right }
        }
        return false
    }
    
    func remove(from data: T) -> Bool {
        guard let root = self.root else { return false }
        
        var parentNode = root
        var currentNode: Node? = root
        
        while let node = currentNode {
            if node.data == data { break }
            if node.data > data { currentNode = node.left }
            else { currentNode = node.right }
            parentNode = node
        }
        guard let deleteNode = currentNode else { return false }
        
        // 1. 자식이 없는 노드 삭제
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode.data > data {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            return true
        }
        
        // 2. 자식이 1개 있는 노드 삭제
        if deleteNode.left != nil && deleteNode.right == nil { // 왼쪽 자식 노드가 존재
            if parentNode.data > data {
                parentNode.left = deleteNode.left
            } else {
                parentNode.right = deleteNode.left
            }
            return true
        }
        
        if deleteNode.left == nil && deleteNode.right != nil { // 오른쪽 자식 노드가 존재
            if parentNode.data > data {
                parentNode.left = deleteNode.right
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        // 3. 자식이 2개 있는 노드 삭제
        guard let rightNode = deleteNode.right else { return false }
        
        var changeNode = rightNode
        var changeParentNode = rightNode
        
        while let nextNode = changeNode.left {
            changeParentNode = changeNode
            changeNode = nextNode
        }
        
        // 오른쪽 자식 노드가 존재하면
        if let changeChildNode = changeNode.right {
            changeParentNode.left = changeChildNode
        } else {
            changeParentNode.left = nil
        }
        
        if parentNode.data > data {
            parentNode.left = changeNode
        } else {
            parentNode.right = changeNode
        }
        
        changeNode.left = deleteNode.left
        changeNode.right = deleteNode.right
        
        return true
    }
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }

}

let BST = BinarySearchTree<Int>()

BST.insert(20)
BST.insert(15)
BST.insert(30)
BST.insert(12)
BST.insert(16)
BST.drawDiagram()
print(BST.search(from: 20))
print(BST.search(from: 14))
print(BST.search(from: 15))
print(BST.remove(from: 30))
BST.drawDiagram()
print(BST.remove(from: 12))
BST.drawDiagram()
