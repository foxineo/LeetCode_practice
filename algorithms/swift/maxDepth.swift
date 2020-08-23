/*
    https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
     剑指 Offer 55 - I. 二叉树的深度
     输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

     例如：

     给定二叉树 [3,9,20,null,null,15,7]，

         3
        / \
       9  20
         /  \
        15   7
     返回它的最大深度 3 。

      

     提示：

     节点总数 <= 10000
     注意：本题与主站 104 题相同：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
     
    */

    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var children: [TreeNode] = [root!]
        var depth: Int = 1
        
        var tmpChildren: [TreeNode] = [TreeNode]()
        
        while children.count > 0 {
            
            let node: TreeNode = children.removeFirst()
            
            if let left = node.left {
                tmpChildren.append(left)
            }
            if let right = node.right {
                tmpChildren.append(right)
            }
            
            if (children.count == 0 && tmpChildren.count > 0) {
                children = tmpChildren
                tmpChildren.removeAll()
                depth += 1
            }
        }
        return depth;
    }