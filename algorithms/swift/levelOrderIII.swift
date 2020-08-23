/*
     剑指 Offer 32 - III. 从上到下打印二叉树 III
     请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

      

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
       [20,9],
       [15,7]
     ]
      

     提示：

     节点总数 <= 1000
     
    */

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [[Int]]()
        }
        
        var res: [[Int]] = [[Int]]()
        
        var queue: [TreeNode] = [root!];
        var level: Int = 0
        while queue.count > 0 {
            var levels: [Int] = [Int]()
            
            let count: Int = queue.count
            var index: Int = 0
            
            let isEven: Bool = level % 2 == 0
            
            while index < count {
                let node: TreeNode = queue.removeFirst()
                
                levels.append(node.val)
                
                if isEven {
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                } else {
                    
                    if let right = node.right {
                        queue.append(right)
                    }
                    if let left = node.left {
                        queue.append(left)
                    }
                }
                index += 1
            }
            queue.reverse()
            res.append(levels)
            level += 1
        }
        
        return res
    }