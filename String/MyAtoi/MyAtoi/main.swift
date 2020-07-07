//
//  main.swift
//  MyAtoi
//
//  Created by 郑志强 on 2020/7/7.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func myAtoi(_ str: String) -> Int {
    
    
    var result: Int32?
    var isNeg = false
    
    for i in 0 ..< str.count {
        
        let ch = String(str[str.index(str.startIndex, offsetBy: i)])
        
        
        if let num = Int32(ch) {
            
            if result == nil || result == 0 {
                
                result = isNeg ? (0 - num) : num
                
            } else {
                
                let num1 = result! &* 10
                let sum = isNeg ? (num1 &- num) : (num1 &+ num)
                
                if sum / 10 != result {
                    return isNeg ? -2147483648 : 2147483647
                } else {
                    result = sum
                }
            }
        }  else if result == nil {
            if ch == " " { continue }
            if ch != "+" && ch != "-" { break }
            isNeg = ch == "-" ? true : false
            result = 0
            
        } else {
            break
        }
    }
    
    return Int(result ?? 0)
    
}

let str = "2147483648"


print(myAtoi2(str))


func myAtoi1(_ str: String) -> Int {
    
    let s = str.trimmingCharacters(in: .whitespaces)
    
    let pattern = "^[+-]?\\d+"
    let re = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let matches = re.matches(in: s, options: .reportProgress, range: NSRange(location: 0, length: s.count))
    
    if let match = matches.first {
        let parseStr = String(s.prefix(match.range.length))
        
        if let result = Int32(parseStr) {
            return Int(result)
        } else {
            return parseStr.first! == "-" ? -2147483648 : 2147483647
        }
    }
    return 0
}


func myAtoi2(_ str: String) -> Int {
    let automaton = Automaton()
    for ch in str {
        automaton.get(ch: String(ch))
    }
    return Int(automaton.ans)
}


class Automaton {
    
    private let start: String, signed: String, number: String, end: String
    private var state: String
    private let table: [String: [String]]
    
    init() {
        start = "start"
        signed = "signed"
        number = "number"
        end = "end"
        
        state = start
        
        table = [start: [start, signed, number, end],
                 signed:[end, end, number, end],
                 number:[end, end, number, end],
                 end:[end, end, end, end]]
    }
    
    func getCol(ch: String) -> Int {
        
        switch ch {
        case " ":
            return 0
            
        case "+", "-":
            return 1
            
        case "0", "1", "2","3","4","5","6","7","8","9":
            return 2
            
        default:
            return 3
        }
        
    }
    
    var sign = 1
    var ans: Int32 = 0
    
    func get(ch: String) {
        
        state = table[state]![getCol(ch: ch)]
        
        if state == number {
            let sum = sign == 1 ? ans &* 10 &+ Int32(ch)! : ans &* 10 &- Int32(ch)!

            if sum / 10 != ans {
                ans = sign == 1 ? 2147483647 : -2147483648
             } else {
                 ans = sum
            }
        } else if state == signed {
            sign = ch == "+" ? 1 : -1
        }
    }
}
