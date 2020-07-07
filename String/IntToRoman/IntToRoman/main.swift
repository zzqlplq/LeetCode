//
//  main.swift
//  IntToRoman
//
//  Created by 郑志强 on 2020/7/6.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func intToRoman(_ num: Int) -> String {
    
    let romans:[Character : Int] = ["I": 1,
                                  "V": 5,
                                  "X": 10,
                                  "L": 50,
                                  "C": 100,
                                  "D": 500,
                                  "M": 1000]

    
    let roman = ["M", "D", "C", "L", "X", "V", "I"]
    
    var result = ""

    let M_count = num / romans["M"]!
    
    let M_remain = num % romans["M"]!
    
    let D_count = M_remain / romans["D"]!
    
    if D_count == 9 {
        result += "CM"
    } else if D_count == 4 {
        result += "CD"
    } else {
        
    }
    
    
    
    
    return result
}
