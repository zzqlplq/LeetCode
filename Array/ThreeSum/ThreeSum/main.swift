//
//  main.swift
//  ThreeSum
//
//  Created by 郑志强 on 2020/6/30.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {

    let arr = nums.sorted()
    
    var results = [[Int]]()
    
    for i in 0 ..< arr.count {
                
        if arr[i] > 0 { return results }
        
        if i > 0 {
            if arr[i] == arr[i - 1] { continue }
        }
        
        let target = 0 - arr[i]
        
        var map = [Int: Int]()
        
        for j in (i+1) ..< arr.count {
            
            let num1 = arr[j]
            
            if let diff = map[target - num1] {
                
                let result = [arr[i], diff, num1]

                if let lastResult = results.last {
                    if !(result[0] == lastResult[0] && result[1] == lastResult[1]) {
                        results.append(result)
                    }
                } else {
                    results.append(result)
                }
            } else {
                map[num1] = num1
            }
        }
    }

    return results
}

let arr = [-2,-3,0,0,-2]


print(threeSum2(arr))



func threeSum2(_ nums: [Int]) -> [[Int]] {

    let arr = nums.sorted()
    
    var results = [[Int]]()

    for i in 0 ..< arr.count {
    
        let num = arr[i]
        
        if num > 0 { return results }

        if i > 0 {
              if num == arr[i - 1] { continue }
        }
        
        var left = i +  1 , right = arr.count - 1
        
        while left < right {
        
            let left_num = arr[left], right_num = arr[right]
            let sum = num + left_num + right_num
            
            if sum > 0 {
                repeat {
                    right = right - 1
                } while (right_num == arr[right] && right > left)
                
            } else if sum < 0 {
                repeat {
                    left = left + 1
                } while (left_num == arr[left] && right > left)

            } else {
                results.append([num, left_num, right_num])

                repeat {
                    right = right - 1
                } while (right > left && right_num == arr[right])
                
                repeat {
                    left = left + 1
                } while (right > left && left_num == arr[left])
                
            }
        }
    }
    
    
    return results
}
