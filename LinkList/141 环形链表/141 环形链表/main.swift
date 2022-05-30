//
//  main.swift
//  141 环形链表
//
//  Created by 郑志强 on 2021/11/20.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
     
        var fastNode = head?.next
        var slowNode = head
        
        while fastNode != nil {
            fastNode = fastNode?.next?.next
            if fastNode === slowNode {
                return true
            }
            slowNode = slowNode?.next
        }
        return false
    }
}
