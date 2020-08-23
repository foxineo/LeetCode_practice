/*
     https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/
     剑指 Offer 32 - II. 从上到下打印二叉树 II
     从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
     
     例如:
     给定二叉树: [3,9,20,null,null,15,7],
     
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
     
     
     提示：
     
     节点总数 <= 1000
     
    */

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        if root == nil {
            return []
        }
        
        
        var queue: [TreeNode] = []
        var res: [[Int]] = []
        queue.append(root!)
        
        while !queue.isEmpty {
            
            var index: Int = 0
            let count: Int = queue.count
            var levels = [Int]()
            
            while index < count {
                
                let temp = queue.removeFirst()
                
                levels.append(temp.val)

                if temp.left != nil {
                    queue.append(temp.left!)
                }
                if temp.right != nil {
                    queue.append(temp.right!)
                }
                index += 1
            }
            res.append(levels)
        }

        return res
    }