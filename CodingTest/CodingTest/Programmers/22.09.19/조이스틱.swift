import Foundation

func solution(_ name:String) -> Int {
    let name = name.map { $0 }
    let aValue = 65
    let zValue = 90
    var answer = 0
    
    func calc(_ ch: Character) -> Int {
        let ascii = Int(ch.asciiValue!)
        let front = ascii - aValue
        let back = zValue + 1 - ascii
        return min(front, back)
    }
    
    for i in 0..<name.count {
        answer += calc(name[i])
    }
    if answer == 0 { return 0 } // A만 있을 때
    
    var count = name.count - 1
    for i in 0..<name.count {
        if name[i] != "A" {
            var nextIndex = i + 1
            
            while nextIndex < name.count && name[nextIndex] == "A" {
                nextIndex += 1
            }
            
            let moveFront = i * 2 + (name.count - nextIndex)
            let moveBack = (name.count - nextIndex) * 2 + i
            count = min(moveFront, count)
            count = min(moveBack, count)
        }
    }
    
    return answer + count
}
