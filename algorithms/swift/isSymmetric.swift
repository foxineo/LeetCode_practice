/*
     剑指 Offer 28. 对称的二叉树
     请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
     
     例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
     
            1
         /    \
        2       2
       / \     / \
      3  4     4   3
     / \ / \  / \  / \
    5  6 7 8  8 7  6 5
     但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
     
       1
      / \
     2   2
      \   \
       3   3
     
     
     
     示例 1：
     
     输入：root = [1,2,2,3,4,4,3]
     输出：true
     示例 2：
     
     输入：root = [1,2,2,null,3,null,3]
     输出：false
     
     
     限制：
     
     0 <= 节点个数 <= 1000
     
     注意：本题与主站 101 题相同：https://leetcode-cn.com/problems/symmetric-tree/
     */
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        let leftRoot: TreeNode? = root?.left
        let rightRoot: TreeNode? = root?.right
        
        return isSymmetricNode(leftRoot, rightRoot)
    }
    
    func isSymmetricNode(_ leftHead: TreeNode?, _ rightHead: TreeNode?) -> Bool {
        if leftHead == nil && rightHead == nil {
            return true
        } else if leftHead == nil || rightHead == nil {
            return false
        } else if leftHead?.val != rightHead?.val {
            return false
        } else {
            return isSymmetricNode(leftHead?.left, rightHead?.right) && isSymmetricNode(leftHead?.right, rightHead?.left)
        }
    }