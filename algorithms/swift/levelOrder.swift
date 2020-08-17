/*
     https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
    剑指 Offer 32 - I. 从上到下打印二叉树
    从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

     

    例如:
    给定二叉树: [3,9,20,null,null,15,7],

        3
       / \
      9  20
        /  \
       15   7
    返回：

    [3,9,20,15,7]
     

    提示：

    节点总数 <= 1000
    */

    func levelOrder(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        // 创建一个队列和结果数组
        var queue: [TreeNode] = []
        var res: [Int] = []

        // 将第一个节点加入到队列
        queue.append(root!)
        
        // 对队列进行遍历
        while !queue.isEmpty {
            let temp = queue.remove(at:0)
            res.append(temp.val)

            if temp.left != nil {
                queue.append(temp.left!)
            }
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }

        // 返回结果
        return res
    }