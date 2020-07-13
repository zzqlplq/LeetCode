//
//  main.swift
//  167-TwoSum
//
//  Created by 郑志强 on 2020/7/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

    var map = [Int: Int]()

    for i in 0 ..< numbers.count {
        let num = numbers[i]
        if let index = map[target - num] {
            return [index + 1, i + 1]
        } else {
            map[num] = i
        }
    }
    
    return [0, 0]
}



let  nums = [2, 7, 11, 15]

print(twoSum1(nums, 9))


func twoSum1(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var left = 0, right = numbers.count - 1
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum > target {
            right -= 1
        } else if sum < target {
            left += 1
        } else {
            return [left + 1, right + 1]
        }
    }
    return [-1, -1]
}
