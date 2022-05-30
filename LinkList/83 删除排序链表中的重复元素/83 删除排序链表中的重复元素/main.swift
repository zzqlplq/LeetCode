//
//  main.swift
//  83 删除排序链表中的重复元素
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
        while node != nil {
            if node?.val == node?.next?.val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        return head
    }
}
