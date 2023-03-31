//  백준 - Numbersrebmun
//  https://www.acmicpc.net/problem/4141
//  Created by 홍은표 on 2023/04/01.

var 🃏 = ""
typealias 🐳 = Character
typealias 🦄 = Int

func 🌈(_ 🦀: 🐳) -> 🦄 {
    let 🍣 = 🦀.asciiValue!
    switch 🍣 {
    case 65...67, 97...99: return 2
    case 68...70, 100...102: return 3
    case 71...73, 103...105: return 4
    case 74...76, 106...108: return 5
    case 77...79, 109...111: return 6
    case 80...83, 112...115: return 7
    case 84...86, 116...118: return 8
    case 87...90, 119...122: return 9
    default: return 0
    }
}

for 🎃 in 0..<🦄(readLine()!)! {
    let 🐢 = readLine()!.map { 🌈($0) }
    var 🍉 = 0, 🍇 = 🐢.count - 1
    var 🍍 = true
    while 🍉 < 🍇 {
        if 🐢[🍉] != 🐢[🍇] { 🍍 = false; break }
        🍉 += 1; 🍇 -= 1
    }
    🃏.write(🍍 ? "YES\n" : "NO\n")
}
print(🃏)
