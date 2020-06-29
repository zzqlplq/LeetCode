import UIKit

func plusOne(_ digits: [Int]) -> [Int] {

    var arr: [Int] = []
    var carry = false
    
    for i in stride(from: digits.count - 1, through:0 , by: -1) {

        let num = digits[i]
        var sub = digits[0 ... i]

        if (i == digits.count - 1 || carry) {
            
            let add = num + 1
            if add == 10 {
                carry = true
                arr.insert(0, at: 0)
                if i == 0 {
                    arr.insert(1, at: 0)
                }
            } else {
                sub[i] = num
                arr.insert(contentsOf: sub, at: 0)
                break
            }
        } else {
            arr.insert(contentsOf: sub, at: 0)
            break
        }
    }
    return arr
}

//plusOne([1,2,3])


func plusOne2(_ digits: [Int]) -> [Int] {

    var arr = digits
    
    for i in stride(from: arr.count - 1, through: 0, by: -1) {

        if arr[i] == 9 {
            arr[i] = 0
        } else {
            arr[i] = arr[i] + 1
            return arr
        }
    }
    arr.insert(1, at: 0)
    return arr
}

plusOne2([1,2,3])
