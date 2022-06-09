//
//  main.swift
//  80 删除有序数组中的重复项
//
//  Created by zhengzhiqiang on 2022/6/9.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        var index = 0
        for i in 2..<nums.count {
            if nums[i] == nums[i-1], nums[i] == nums[index] {
                continue
            } else {
                nums[index+2] = nums[i];
                index += 1;
            }
        }
        return index + 2
    }
    
    func removeDuplicates1(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        var index = 2
        for i in 2..<nums.count {
            if nums[i] != nums[index-2] {
                nums[index] = nums[i]
                index += 1;
            }
        }
        return index
    }
    
}
