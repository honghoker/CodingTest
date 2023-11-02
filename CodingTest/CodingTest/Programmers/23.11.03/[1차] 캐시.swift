//  프로그래머스 - [1차] 캐시
//  https://school.programmers.co.kr/learn/courses/30/lessons/17680
//  Created by 홍은표 on 23/3/11.

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize != 0 else { return cities.count * 5 }
    var cache = [String: Int](), r = 0
    cities.enumerated().forEach {
        let city = $0.element.lowercased()
        if let _ = cache[city] {
            r += 1
        } else {
            if cache.count == cacheSize { cache[cache.min(by: { $0.value < $1.value })!.key] = nil }
            r += 5
        }
        cache[city] = $0.offset
    }
    return r
}
