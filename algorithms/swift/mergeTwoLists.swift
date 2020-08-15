/*
     剑指 Offer 25. 合并两个排序的链表
     输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

     示例1：

     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4
     限制：

     0 <= 链表长度 <= 1000

     注意：本题与主站 21 题相同：https://leetcode-cn.com/problems/merge-two-sorted-lists/
     
     */
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var head: ListNode? = nil
        var current: ListNode? = nil
        
        var tmpNode1: ListNode? = l1
        var tmpNode2: ListNode? = l2
        var targetNode: ListNode? = nil
        
        while tmpNode1 != nil || tmpNode2 != nil {
            
            if tmpNode1 == nil {
                targetNode = tmpNode2
                tmpNode2 = tmpNode2?.next
            } else if tmpNode2 == nil {
                targetNode = tmpNode1
                tmpNode1 = tmpNode1?.next
            } else if tmpNode1!.val < tmpNode2!.val {
                targetNode = tmpNode1
                tmpNode1 = tmpNode1?.next
            } else {
                targetNode = tmpNode2
                tmpNode2 = tmpNode2?.next
            }
            
            if head == nil {
                head = targetNode
                current = head
            } else {
                current?.next = targetNode
                current = current?.next
            }
        }
        
        return head
    }

    // 递归算法
    func mergeTwoLists_recursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var head: ListNode?
        if l1!.val > l2!.val{
            head = l2
            head?.next = mergeTwoLists(l1, l2?.next)
        } else {
            head = l1
            head?.next = mergeTwoLists(l1?.next, l2)
        }
        
        return head
    }


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}