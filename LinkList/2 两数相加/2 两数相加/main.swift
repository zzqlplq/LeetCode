//
//  main.swift
//  2 两数相加
//
//  Created by zhengzhiqiang on 2022/5/26.
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        guard l1 != nil else { return l2}
        guard l2 != nil else { return l1}
        
        let head = ListNode(0)
        var move = head
        
        var p1 = l1
        var p2 = l2
        
        var decimal = 0
        
        while (p1 != nil || p2 != nil) {
            var value = (p1?.val ?? 0) + (p2?.val ?? 0) + decimal
            if value > 9 {
                decimal = 1
                value = value - 10
            } else {
                decimal = 0
            }
            move.next = ListNode(value)
            move = move.next!
            p1 = p1?.next
            p2 = p2?.next
        }
        if decimal > 0 {
            move.next = ListNode(1)
        }
        return head.next
    }
}

