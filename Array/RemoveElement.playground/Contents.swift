import UIKit

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
     
    guard !nums.isEmpty else {
        return nums.count
    }
    
    var offset = 0
    
    for i in 0 ..< nums.count {
        let num = nums[i]
        if num != val {
            nums[offset] = num
            offset = offset + 1
        }
    }
    print(nums)

    return offset + 1
 }

var nums = [1,2,3]

removeElement(&nums, 1)

