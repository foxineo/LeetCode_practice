/*
     面试题07. 重建二叉树
     输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

     例如，给出

     前序遍历 preorder = [3,9,20,15,7]
     中序遍历 inorder = [9,3,15,20,7]
     返回如下的二叉树：

         3
        / \
       9  20
         /  \
        15   7
     限制：
     0 <= 节点个数 <= 5000
     注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
     */
    
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if preorder.count == 0 {
            return nil
        }
        let root: TreeNode = TreeNode.init(preorder.first!)
        
        let rootIndex: Int! = inorder.firstIndex(of: root.val)
        
        
        root.left = buildTree(
            Array(preorder[1..<rootIndex+1]),
            Array(inorder[0..<rootIndex])
        )
        
        root.right = buildTree(
            Array(preorder[rootIndex+1..<preorder.endIndex]),
            Array(inorder[rootIndex+1..<preorder.endIndex])
        )
        return root
    }