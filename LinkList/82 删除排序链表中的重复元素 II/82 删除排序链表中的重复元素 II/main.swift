//
//  main.swift
//  82 删除排序链表中的重复元素 II
//
//  Created by 郑志强 on 2021/11/22.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        var hasSame = false
        var result: ListNode?
        var index: ListNode?
        while node != nil {
            if node?.val == node?.next?.val {
                hasSame = true
            } else {
                if !hasSame {
                    if result == nil {
                        result = ListNode(node!.val)
                        index = result
                    } else {
                        result?.next = ListNode(node!.val)
                        result = result?.next
                    }
                }
                hasSame = false
            }
            node = node?.next
        }
        return index
    }
    
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        var indexs = [Int]()
        var i = 0
        var node = head
        while node != nil {
            if node?.val == node?.next?.val {
                node?.next = node?.next?.next
                indexs.append(i)
            } else {
                node = node?.next
                i += 1
            }
        }
        
        var result: ListNode?
        var index: ListNode?
        node = head
        var count = 0
        while node != nil {
            if !indexs.contains(count) {
                if result == nil {
                    result = ListNode(node!.val)
                    index = result
                } else {
                    result?.next = ListNode(node!.val)
                    result = result?.next
                }
            }
        }
        return index
    }
    
    
}

let arr = [2,3,3,4,4,5].map{ListNode($0)}
let head: ListNode? = ListNode(1);
var index = head
for i in 0..<arr.count {
    index?.next = arr[i]
    index = index?.next
}

let s = Solution()
var result = s.deleteDuplicates(head)

while result != nil {
    print("val == \(result?.val ?? -99)")
    result = result?.next
}

