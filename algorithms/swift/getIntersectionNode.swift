/**
 https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/
 剑指 Offer 52. 两个链表的第一个公共节点
 输入两个链表，找出它们的第一个公共节点。

 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
 本题与主站 160 题相同：https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        guard headA != nil && headB != nil else {
            return nil
        }
        
        var lengthA: Int = 0
        var lengthB: Int = 0
        
        var tmpA :ListNode? = headA
        var tmpB :ListNode? = headB
        
        while tmpA?.next != nil {
            tmpA = tmpA?.next
            lengthA += 1
        }
        while tmpB?.next != nil {
            tmpB = tmpB?.next
            lengthB += 1
        }
        
        var gap: Int = 0
        var longList: ListNode?
        var shortList: ListNode?
        if lengthA > lengthB {
            gap = lengthA - lengthB
            longList = headA
            shortList = headB
        } else {
            gap = lengthB - lengthA
            longList = headB
            shortList = headA
        }
        
        for _ in 0..<gap {
            longList = longList?.next
        }
        while longList != nil {
            if longList?.val == shortList?.val {
                return longList
            }
            longList = longList?.next
            shortList = shortList?.next
        }
        return nil
    }
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ value: Int) {
        self.val = value
        self.next = nil
    }
}
