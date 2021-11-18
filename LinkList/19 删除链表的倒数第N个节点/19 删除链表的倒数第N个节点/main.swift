//
//  main.swift
//  19 删除链表的倒数第N个节点
//
//  Created by 郑志强 on 2021/11/17.
//

import Foundation


public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;}
}


class Solution {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fastNode = head
        var slowNode : ListNode?
        var distance = n

        while fastNode != nil {
            if distance == 0 {
                slowNode = head
            } else if distance < 0 {
                slowNode = slowNode?.next
            }
            fastNode = fastNode?.next
            distance -= 1
        }
        if distance == 0 {
            return head?.next
        } else if slowNode != nil {
            slowNode?.next = slowNode?.next?.next
            return head
        }
        return nil
    }
    
    func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummynode: ListNode? = ListNode(0, head)
        var fastNode = head
        var slowNode = dummynode
        var distance = n
        while fastNode != nil {
            fastNode = fastNode?.next
            distance -= 1
            if distance < 0 {
                slowNode = slowNode?.next
            }
        }
        slowNode?.next = slowNode?.next?.next
        return dummynode?.next
    }
    
}
