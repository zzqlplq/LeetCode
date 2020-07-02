//
//  main.swift
//  ThreeSumClosest
//
//  Created by 郑志强 on 2020/7/2.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

    let arr = nums.sorted()

    var reslut = nums[0] + nums[1] + nums[2]
    
    for i in 0 ..< arr.count {

        if i > 0 && arr[i] == arr[i - 1] { continue }
        
        let num = arr[i]
        
        var left = i, right = arr.count - 1
        
        while left < right {
            
            let sum = num + arr[left] + arr[right]
            
            let diff = min(abs(target - reslut), abs(target - sum))

            if diff == abs(target - sum) {
                 reslut = sum
             }
            
            if sum - target > 0 {
                right = right - 1
            } else if sum - target < 0 {
                left = left + 1
            } else {
                return reslut
            }
        }
    }
    return reslut
}


let nums = [0,1,2]

print(threeSumClosest(nums, 0))

