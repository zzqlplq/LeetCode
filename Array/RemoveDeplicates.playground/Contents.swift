import UIKit

var str = "Hello, playground"


func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    guard !nums.isEmpty else {
        return nums.count
    }
    let count = nums.count
    var offset = 0
    var last = nums[offset]

    for i in 1 ..< count {
        let num = nums[i]
        if num != last {
            offset = offset + 1
            last = num
            nums[offset] = last
        }
    }
    print(nums)
    return offset + 1
    
 }


var nums : [Int] = [1,2,2,5,5]
let result = removeDuplicates(&nums)
