//
//  main.swift
//  ValidParentheses
//
//  Created by 郑志强 on 2020/7/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func isValid(_ s: String) -> Bool {

    var array = [Character]()
    let parentheses: [Character: Character] = ["}":"{", ")":"(", "]":"["]
    
    for i in s {
        if i == "(" || i == "{" || i == "[" {
            array.append(i)
        } else if let last = array.last, last == parentheses[i]! {
            array.removeLast()
        } else {
            return false
        }
    }
    return array.count == 0
}

let s = "{[]}"

print(isValid(s))
