/*
     面试题13. 机器人的运动范围
     https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
     
     地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

      

     示例 1：

     输入：m = 2, n = 3, k = 1
     输出：3
     示例 2：

     输入：m = 3, n = 1, k = 0
     输出：1
     提示：

     1 <= n,m <= 100
     0 <= k <= 20
     */
    
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        let xOffset = [-1, 0, 1, 0]
        let yOffset = [0, -1, 0, 1]
        
        var array:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        array[0][0] = true
        
        var cur:[(Int, Int)] = [(0, 0)]
        var ans = 1
        
        while !cur.isEmpty {
            let last:(Int, Int) = cur.removeLast()
            
            for index in 0...3 {
                let x = last.1 + xOffset[index]
                let y = last.0 + yOffset[index]
                
                if x >= n || x < 0 || y >= m || y < 0 {
                    continue
                }
                
                if array[y][x] {
                    continue
                }
                
                if getSum(x) + getSum(y) > k {
                    continue
                }
                
                array[y][x] = true
                cur.append((y, x))
                ans += 1
            }
        }
        
        return ans
    }
    
    func getSum(_ num: Int) -> Int {
            var ans = 0
            var num = num
            while num != 0 {
                ans += num % 10
                num = num / 10
            }
            return ans
    }