import UIKit

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    
    let period = nums.count / k
    var periodMin: Int = -99

    for i in 0 ..< k {
        
        var periodMax: Int = -99

        let periodEnd = i == k - 1 ? (period * i + period) : (nums.count - period * i)
        
        for j in period * i ..< periodEnd {
            periodMax = max(nums[j], periodMax)
        }
        periodMin = min(periodMin, periodMax)
    }

    return periodMin
}

findKthLargest([3,2,1,5,6,4], 2)

