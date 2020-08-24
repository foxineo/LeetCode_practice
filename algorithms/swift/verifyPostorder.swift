

/**

二叉查找树，也称为二叉搜索树、有序二叉树或排序二叉树，是指一棵空树或者具有下列性质的二叉树： 
若任意节点的左子树不空，则左子树上所有节点的值均小于它的根节点的值； 
若任意节点的右子树不空，则右子树上所有节点的值均大于或等于它的根节点的值； 任意节点的左、右子树也分别为二叉查找树

*/

/*
     https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
     剑指 Offer 33. 二叉搜索树的后序遍历序列
     输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

     参考以下这颗二叉搜索树：

          5
         / \
        2   6
       / \
      1   3
     示例 1：

     输入: [1,6,3,2,5]
     输出: false
     示例 2：

     输入: [1,3,2,6,5]
     输出: true
      
     提示：
     数组长度 <= 1000
    */
class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {

        if postorder.isEmpty || postorder.count == 1 {
            return true
        }

        let root: Int = postorder.last!
        var rightOrderIndex: Int = 0
        
        for num in postorder[0...postorder.count - 2] {
            if num >= root {
                break
            }
            rightOrderIndex += 1
        }
        
        if rightOrderIndex < postorder.count - 1 {
            for num in postorder[rightOrderIndex..<postorder.count - 1] { //查看右半部分节点是否满足条件。
                if num < root {
                    return false
                }
            }
        }
        
        var leftRet: Bool = true
        if rightOrderIndex > 0 {
            leftRet = verifyPostorder(Array(postorder[0...rightOrderIndex - 1]))
        }
        
        var rightRet: Bool = true
        if rightOrderIndex < postorder.count - 1 {
            rightRet = verifyPostorder(Array(postorder[rightOrderIndex...postorder.count - 2]))
        }
        
        return leftRet && rightRet
    }
}

let ret =  Solution().verifyPostorder([1,3,2,6,5])
print("result = \(ret)")

