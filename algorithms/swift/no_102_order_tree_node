/*
 102. 二叉树的层序遍历
 
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

  

 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    public var result:[[Int]] = []
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let tree: TreeNode = root else {
            return []
        }
        orderTreeNode(tree, 0)
        return result
    }
    
    func orderTreeNode(_ node: TreeNode, _ depth: Int) {
        if result.count == depth {
            result.append([node.val])
        } else {
            result[depth].append(node.val)
        }
        
        if let left = node.left {
            orderTreeNode(left, depth + 1)
        }
        
        if let right = node.right {
            orderTreeNode(right, depth + 1)
        }
    }
}