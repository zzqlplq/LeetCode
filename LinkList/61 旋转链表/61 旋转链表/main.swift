//
//  main.swift
//  61 旋转链表
//
//  Created by 郑志强 on 2021/11/18.
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var index = head
        var trailNode = head
        var count = 1
        while trailNode?.next != nil {
            trailNode = trailNode?.next
            count += 1
        }
        // 链接成环
        trailNode?.next = head
        
        // 单向链表右旋转，等价头结点向左移动k的的位置，等价于头结点向右移动 count-k 个位置
        var dis = count - (k % count)
        
        // 移动为0部或者等于环的长度，断开环，并返回
        if dis == 0 || dis == count {
            trailNode?.next = nil
            return head
        }
        
        // 移动到需要断开的节点的前一个位置，不然没办法正确断开环
        while dis > 1 {
            index = index?.next
            dis -= 1
        }
        let temp = index?.next
        index?.next = nil
        return temp
    }
}



