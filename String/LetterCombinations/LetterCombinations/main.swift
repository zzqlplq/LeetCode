//
//  main.swift
//  LetterCombinations
//
//  Created by 郑志强 on 2020/7/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    
    guard !digits.isEmpty else { return [""] }
    backtrack("", digits)
    return output

}


let map = ["2": ["a", "b", "c"],
           "3": ["d", "e", "f"],
           "4": ["g", "h", "i"],
           "5": ["j", "k", "l"],
           "6": ["m", "n", "o"],
           "7": ["p", "q", "r", "s"],
           "8": ["t", "u", "v"],
           "9": ["w", "x", "y", "z"]]

var output = [String]()

func backtrack(_ combination: String, _ next_digits: String) {
    
    if next_digits.count == 0 {
        output.append(combination)
    
    } else {
        let digit = next_digits.prefix(1)
        let letters = map[String(digit)]!

        for letter in letters {
            backtrack(combination + letter, String(next_digits.suffix(next_digits.count - 1)))
        }
    }
}


let s = "678"

print(letterCombinations(s))



func letterCombinations1(_ digits: String) -> [String] {
    
    var result = [""]
    let arr = Array(digits)
    
    for i in 0 ..< digits.count {
        var tempResult = [String]()
        let letters = map[String(arr[i])]!
        for letter in letters {
            for tmp in result {
                tempResult.append(tmp + letter)
            }
        }
        result = tempResult
    }
    return result
}



func letterCombinations2(_ digits: String) -> [String] {
    
    

    

    return [""]
}
