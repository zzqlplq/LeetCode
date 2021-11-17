//
//  main.swift
//  39-CombinationSum
//
//  Created by 郑志强 on 2020/7/13.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
      
    var results = [[Int]]()
    
    for i in 0 ..< candidates.count {
        let diff = target - candidates[i]
        let result = backtrack(i, candidates.suffix(candidates.count - i), diff)
        if let result = result {
            results.append(result)
        }
    }
    return results
  }


var result = [Int]()

func backtrack(_ index: Int, _ candidates:[Int], _ target: Int) -> [Int]? {

    guard target < candidates[index] else { return nil }
    
    var map = [Int: Int]()
    
    for i in 0 ..< candidates.count {
        let num = candidates[i]
        if map[target - num] != nil {
            result.append(num)
        } else {
            map[num] = i
        }
    }
    
    return [1]
}


let nums = [2,3,6,7]

print(combinationSum(nums, 7))
