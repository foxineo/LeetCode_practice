
/*
 面试题06. 从尾到头打印链表
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

 示例 1：
 输入：head = [1,3,2]
 输出：[2,3,1]
  
 限制：
 0 <= 链表长度 <= 10000
 
 */


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        guard head != nil && head?.val != nil else {
            return []
        }
        
        var result:[Int] = []
        
        var node:ListNode? = head!
        while node != nil {
            result.insert(node!.val, at: 0)
            node = node!.next ?? nil
        }
        
        return result
    }
}
