//
//  main.swift
//  findKthLargest
//
//  Created by 郑志强 on 2020/6/29.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
   return nums.sorted(by: >)[k - 1]
}

print(findKthLargest([1,2,3,4,5,6], 2))

