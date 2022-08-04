//
//  방금 그곡.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/04.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer = [(String, Int)]()
    let m = m.replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
    
    for musicInfo in musicinfos {
        let musicInfo = musicInfo.split(separator: ",").map { String($0) }
        let start = musicInfo[0].split(separator: ":").map{ Int(String($0))! }
        let end = musicInfo[1].split(separator: ":").map{ Int(String($0))! }
        let title = musicInfo[2]
        let music = musicInfo[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map { String($0) }
        
        let runTime = ((end[0] - start[0]) * 60) + (end[1] - start[1])
        
        var info = ""
        for i in 0..<runTime {
            let index = i % music.count
            info += music[index]
        }
        
        if info.contains(m) {
            answer.append((title, runTime))
        }
    }
    
    return answer.max { $0.1 < $1.1 }?.0 ?? "(None)"
}
