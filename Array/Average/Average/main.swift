//
//  main.swift
//  Average
//
//  Created by 郑志强 on 2020/6/30.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func average(_ salary: [Int]) -> Double {
    
    var minSal = salary.first!
    var maxSal = salary.first!
    var sum = salary.first!
    
    for i in 1 ..< salary.count {
        let s = salary[i]
        
        minSal = min(minSal, s)
        maxSal = max(maxSal, s)
        sum = sum + s
    }
    return Double((sum - minSal - maxSal) / (salary.count - 2))
}



func average1(_ salary: [Int]) -> Double {
    
    var minSal = salary.first!
    var maxSal = salary.first!
    
    let sum =  salary.reduce(0) { (r, s) in
        
        minSal = min(minSal, s)
        maxSal = max(maxSal, s)
        return r + s
    }
    
    return Double((sum - minSal - maxSal) / (salary.count - 2))
}

