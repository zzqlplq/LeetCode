//
//  main.swift
//  RomanToInt
//
//  Created by 郑志强 on 2020/7/6.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    
    let romans:[Character : Int] = ["I": 1,
                                  "V": 5,
                                  "X": 10,
                                  "L": 50,
                                  "C": 100,
                                  "D": 500,
                                  "M": 1000]
    
    let arr:[Character] = Array(s)
    
    var sum = 0

    for i in 0 ..< arr.count {
        let ch = arr[i]
        if i < arr.count - 1 && (romans[ch]! < romans[arr[i + 1]]!) {
            sum -= romans[ch]!
        } else {
            sum += romans[ch]!
        }
    }

    return sum
}



let s = "IV"

print(romanToInt(s))
