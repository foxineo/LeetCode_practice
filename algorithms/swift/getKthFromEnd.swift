/*
     https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
     剑指 Offer 22. 链表中倒数第k个节点
     输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。

      

     示例：

     给定一个链表: 1->2->3->4->5, 和 k = 2.

     返回链表 4->5.
     通过次数63,824提交次数80,779
    */

	class ListNode {
	    public var value: Int
	    public var next: ListNode?
	    
	    public init(_ val: Int) {
	        self.value = val
	        self.next = nil
	    }
	}

    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var index: Int = 0
        var fastNode: ListNode? = head
        var slowNode: ListNode? = head
        
        while fastNode != nil {
            
            if index >= k {
                slowNode = slowNode?.next
            }
            fastNode = fastNode?.next
            index += 1
        }
        return slowNode
    }