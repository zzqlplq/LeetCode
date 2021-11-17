//
//  main.swift
//  34 查找元素
//
//  Created by 郑志强 on 2021/11/11.
//

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {

        var left = 0
        var right = nums.count - 1
        
        while left <= right {
           let mid = left + (right - left) / 2
            if nums[mid] >= target  {
                right = mid - 1
            } else if nums[mid] < target  {
                left = mid + 1
            }
        }

        if left < nums.count, nums[left] == target {
            var r = left
            for i in left ..< nums.count {
                if nums[i] != target { break }
                r += 1
            }
            return [left, r]
        }
        return [-1, -1]
    }
}

let nums = [1,4,4,5]

print(Solution().searchRange(nums, 4))


