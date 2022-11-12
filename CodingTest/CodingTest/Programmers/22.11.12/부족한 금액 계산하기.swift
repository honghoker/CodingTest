//  프로그래머스 - 부족한 금액 계산하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/82612
//  Created by 홍은표 on 2022/11/12.

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var money = money
    var idx = 1
    while money >= price * idx || idx <= count  {
        money -= price * idx
        idx += 1
    }
    
    return money > 0 ? 0 : Int64(abs(money))
}
