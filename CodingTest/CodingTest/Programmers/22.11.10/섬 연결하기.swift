//  프로그래머스 - 섬 연결하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/42861
//  Created by 홍은표 on 2022/11/10.

import Foundation

var parentArray = [Int]()

func isCycle(_ left: Int, _ right: Int) -> Bool {
    // 연결하는 다리가 사이클을 형성하는지 확인
    return parentArray[left] == parentArray[right]
}

func connectBridge(_ left: Int, _ right: Int) {
    // oldParent로 right의 가장 부모를 가진 것들을 newParent를 left의 가장 부모로 바꿔준다.
    changeParent(findParent(right), findParent(left))
}

func findParent(_ child: Int) -> Int {
    // parrentArray의 child번째가 child라면 가장 위 부모, 아니라면 재귀
    return parentArray[child] == child ? child : findParent(parentArray[child])
}

func changeParent(_ oldParent: Int, _ newParent: Int) {
    // oldParent의 값을 가진 index를 찾아내서 해당 index의 값을 newParent로 바꿔준다.
    parentArray.indices.filter { parentArray[$0] == oldParent }.forEach { parentArray[$0] = newParent }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    // 자기 자신을 부모로 지정
    parentArray = (0..<n).map{ $0 }
    // cost 값에 따라 정렬
    let sortByCost = costs.sorted{$0[2] < $1[2]}
    
    var sum = 0
    
    for bridge in sortByCost {
        if !isCycle(bridge[0], bridge[1]) {
            // 다리 연결
            connectBridge(bridge[0], bridge[1])
            sum += bridge[2]
        }
    }
    
    return sum
}
