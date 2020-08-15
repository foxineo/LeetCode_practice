/*
     
     剑指 Offer 24. 反转链表
     定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

     示例:
     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL

     限制：
     0 <= 节点个数 <= 5000
     
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        if head == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = head
        var next: ListNode? = head?.next
        
        while cur != nil {
            cur?.next = pre
            pre = cur
            cur = next
            next = cur?.next
            
        }
        return pre
        
        
        

        // 以下是遍历节点，重建链表的方法
//        var ret: ListNode? = nil
//
//        var tmpNode: ListNode? = head
//
//        while tmpNode != nil {
//
//            let node: ListNode = ListNode.init(tmpNode!.val)
//            if ret != nil {
//                node.next = ret
//            }
//            ret = node
//            tmpNode = tmpNode?.next
//        }
//        return ret
    }