//
//  main.swift
//  IsUnique
//
//  Created by 郑志强 on 2020/6/30.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func isUnique(_ astr: String) -> Bool {
    
    guard astr.count < 24 else {
        return false
    }
    
    var map = [String: String]()
    
    for i in 0 ..< astr.count {
        let ch =  String(astr[astr.index(astr.startIndex, offsetBy: i)])
        if map[ch] != nil {
            return false
        } else {
            map[ch] = ch
        }
    }
    return true
}


func isUnique2(_ astr: String) -> Bool {
    
    guard astr.count < 24 else {
        return false
    }
    
    var mark = 0
    for ch in astr.unicodeScalars {
        let move = ch.value - "a".unicodeScalars.first!.value
        let offset = 1 << move  // 位
        
        if mark & offset != 0 {
            return false
        } else {
            mark = mark | offset
        }
    }
    return true
}


isUnique2("string")

