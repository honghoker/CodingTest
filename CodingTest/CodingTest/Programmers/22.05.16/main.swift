//
//  신규 아이디 추천
//  CodingTest
//
//  Created by 홍은표 on 2022/05/16.
//

import Foundation

func solution(_ new_id:String) -> String {
    var result = new_id
    // 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    result = result.lowercased()
    // 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    let removeCharacters = ["-", "_", "."]
    result = result.filter { $0.isLetter || $0.isNumber || removeCharacters.contains(String($0)) }.map { String($0) }.joined()
    
    // 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    // 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    if result.first == "." { result.removeFirst() }
    if result.last == "." { result.removeLast() }
    // 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if result.isEmpty { result = "a" }
    // 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
         // 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if result.count >= 16 {
        result = String(result.prefix(15))
        if result.last == "." { result.removeLast() }
    }
    // 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    if result.count <= 2 {
        let lastChar = result.last
        while result.count != 3 {
            result = String(String(result) + String(lastChar!))
        }
    }
    return result
}
