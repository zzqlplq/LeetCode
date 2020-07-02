//
//  main.swift
//  FourSumCount
//
//  Created by 郑志强 on 2020/7/2.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    
    let arrA = A.sorted()
    let arrB = B.sorted()
    let arrC = C.sorted()
    let arrD = D.sorted()
    
    
    var result = 0
    
    for i in 0 ..< arrA.count {
                
        let num = 0 - arrA[i]
        print("num: \(num)")
        
        for j in 0 ..< arrB.count {
                     
            var left = 0, right = arrD.count - 1
            
            while (left < arrC.count && right >= 0) {
                
                let sum = arrB[j] + arrC[left] + arrD[right]
                
                print("arrB[j]:\(arrB[j]) + arrC[left]:\(arrC[left]) + arrD[right]:\(arrD[right])")
                
                if sum > num {
                    right = right - 1
                } else if sum < num {
                    left = left + 1
                } else {
                    print(" == 0 arrB[j]:\(arrB[j]) + arrC[left]:\(arrC[left]) + arrD[right]:\(arrD[right])")
                    result = result + 1
                }
            }
        }
    }
    
    return result
}






let A = [0,1,-1]
let B = [-1,1,0]
let C = [0,0,1]
let D = [-1,1,1]

print(fourSumCount(A, B, C, D))
