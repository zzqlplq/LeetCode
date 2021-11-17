//
//  main.swift
//  56 合并区间
//
//  Created by 郑志强 on 2021/11/7.
//

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {

        let sorted = intervals.sorted { $0.first! < $1.first!}
        var results = [[Int]]()
        
        for i in 0..<sorted.count {
            let r = sorted[i]
            if let last = results.last, last.last! >= r.first!  {
                results[results.count - 1][1] = max(last.last!, r.last!)
            } else {
                results.append(r)
            }
        }
        return results
    }
}


let s = Solution()
let intervals = [[1,4],[4,5]]

print(s.merge(intervals))
