import UIKit

func maxArea(_ height: [Int]) -> Int {
    
    var temp = 0
    for i in 0 ..< height.count {
        for j in (i+1) ..< height.count {
            let area = (j - i ) * min(height[i], height[j])
            temp = max(area, temp)
        }
    }
    return temp
}


let result = maxArea([1,8,6,2,5,4,8,3,7])

print(result)
