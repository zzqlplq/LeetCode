//
//  main.swift
//  FourSum
//
//  Created by 郑志强 on 2020/7/2.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    var results = [[Int]]()
    let arr = nums.sorted()
    
    print(arr)
    
    for i in 0 ..< arr.count {

        if i > 0 && arr[i] == arr[i - 1] { continue }
        
        let diff = target - arr[i]
        
        print("diff:: \(diff)")
        
        for j in (i+1) ..< arr.count {
    
            if j > (i + 1) && arr[j] == arr[j - 1] { continue }
            
            var left = j + 1, right = arr.count - 1
            
            while left < right {
                
                let sum = arr[j] + arr[left] + arr[right]
                
                print("arr[j]:\(arr[j]) arr[left]:\(arr[left]) arr[right]:\(arr[right]) sum:\(sum)");
                
                if sum > diff {
                    right = right - 1
                } else if sum < diff {
                    left = left + 1
                } else {
                    results.append([arr[i], arr[j], arr[left], arr[right]])
                                    
                    repeat {
                        right = right - 1
                    } while (left < right && arr[right] == arr[right + 1])
                    
                    repeat {
                        left = left + 1
                    } while (left < right && arr[left] == arr[left - 1])
                    
                }
            }
        }
    }
    return results
}


let nums = [-5,-4,-3,-2,-1,0,0,1,2,3,4,5]

let nums1 = [0,4,-5,2,-2,4,2,-1,4]

let nums2 = [2,0,3,0,1,2,4]

print(fourSum(nums2, 7))
