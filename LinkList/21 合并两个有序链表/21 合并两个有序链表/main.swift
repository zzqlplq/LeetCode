//
//  main.swift
//  21 合并两个有序链表
//
//  Created by zhengzhiqiang on 2024/5/14.
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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }

        // 设置head
        let head = ListNode(0)
        var move = head
        var l1 = list1
        var l2 = list2
        
        while (l1 != nil) && (l2 != nil) {
            if l1!.val <= l2!.val {
                move.next = l1
                l1 = l1!.next
            } else if l1!.val > l2!.val {
                move.next = l2
                l2 = l2?.next
            }
            move = move.next!
        }
        if (l1 != nil) {
            move.next = l1
        } else if (l2 != nil) {
            move.next = l2
        }
        return head.next
    }
    
    func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }

        // 设置head
        let head = ListNode(0)
        var move = head
        var l1 = list1
        var l2 = list2
        
        while (l1 != nil) && (l2 != nil) {
            if l1!.val < l2!.val {
                move.next = l1
                l1 = l1!.next
                move = move.next!
            } else if l1!.val > l2!.val {
                move.next = l2
                l2 = l2?.next
                move = move.next!
            } else {
                move.next = l1
                l1 = l1!.next
                move = move.next!
                move.next = l2
                l2 = l2?.next
                move = move.next!
            }
        }
        if (l1 != nil) {
            move.next = l1
        }
        if (l2 != nil) {
            move.next = l2
        }
        return head.next
    }
    
}
