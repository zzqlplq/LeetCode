//
//  main.swift
//  142 环形链表II
//
//  Created by 郑志强 on 2021/11/21.
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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var nodes = Array<ListNode>()
        var index = head
        while index != nil {
            if let node = nodes.first(where: {$0 === index}) {
                return node
            } else {
                nodes.append(index!)
                index = index?.next
            }
        }
        return nil
    }
    
    func detectCycle1(_ head: ListNode?) -> ListNode? {

        var fast = head?.next
        var slow = head
        var index: ListNode? = ListNode(-99)
        index!.next = head
        var isCycle = false
        while slow != nil {
            if index === slow {
                return index
            }
            if fast === slow {
                isCycle = true
                index = index?.next
            } else {
                fast = isCycle ? fast : fast?.next?.next
            }
            slow = slow?.next
        }
        return nil
    }
    
    
    func detectCycle1_1(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        var index: ListNode?
        var isCycle = false

        while slow != nil {
            if index === slow {
                return index
            }
            slow = slow?.next
            fast = isCycle ? fast : fast?.next?.next
            if fast === slow {
                isCycle = true
                index = (index == nil) ? head : index?.next
            }
        }
        return nil
    }
    
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                var index = head
                while index !== slow {
                    index = index?.next
                    slow = slow?.next
                }
                return index
            }
        }
        return nil
    }
    
    func detectCycle3(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        var count = 0
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                while fast !== slow?.next {
                    count += 1
                    slow = slow?.next
                }
                break
            }
        }
        
        fast = head
        slow = nil
        
        while fast != nil {
            if count <= 0 {
                slow = (slow == nil) ? head : slow?.next
            }
            if fast?.next === slow {
                return slow
            }
            fast = fast?.next
            count -= 1
        }
        return nil
    }
}
