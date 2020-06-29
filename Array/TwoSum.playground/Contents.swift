import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    let count = nums.count
    for i in 0..<count {
        for j in (i+1)..<count {
            if (target - nums[i]) == nums[j] {
                return [i, j]
            }
        }
    }
    return [0, 0]
}


func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        let num1 = nums[i]
        if let index = map[target - num1] {
            return [i, index]
        } else {
            map[num1] = i
        }
    }
    return [0, 0]
}


twoSum1([2,1,4], 5)
