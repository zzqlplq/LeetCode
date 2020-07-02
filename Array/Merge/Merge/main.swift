//
//  main.swift
//  Merge
//
//  Created by 郑志强 on 2020/7/2.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var point1 = m - 1
    var point2 = n - 1
    
    for i in stride(from: nums1.count - 1, through: 0, by: -1) {
        
        if point2 < 0 { break }
        if point1 < 0 || nums1[point1] < nums2[point2] {
            nums1[i] = nums2[point2]
            point2 = point2 - 1
        } else {
            nums1[i] = nums1[point1]
            point1 = point1 - 1
        }
    }
}

func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var point1 = m - 1
    var point2 = n - 1
    var index = nums1.count - 1
    while point2 > 0 {

        if point1 < 0 || nums1[point1] < nums2[point2] {
            nums1[index] = nums2[point2]
            point2 = point2 - 1
        } else {
            nums1[index] = nums1[point1]
            point1 = point1 - 1
        }
        index = index - 1
    }
}



var num1 = [2,0]

var num2 = [1]


merge(&num1, 1, num2, 1)

print(num1)
