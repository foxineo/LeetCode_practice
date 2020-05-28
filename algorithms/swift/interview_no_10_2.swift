/*
     面试题10- II. 青蛙跳台阶问题
     一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

     答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

     示例 1：

     输入：n = 2
     输出：2
     示例 2：

     输入：n = 7
     输出：21
     提示：

     0 <= n <= 100
     注意：本题与主站 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/
     */
    
    class Solution {
        
        func numWays(_ n: Int) -> Int {
            if n < 2 { return 1 }
                    var first = 1
                    var second = 1
                    let tag = Int(1e9 + 7)
                    for _ in 2...n {
                        let sum = (first + second) % tag
                        first = second
                        second = sum
                    }
            print("true \(second)")
            
            if n == 0 {
                return 1
            } else if n < 3 {
                return n
            } else {
                var index:Int = 2
                var current:Int = 2
                var last:Int = 1
                var lastLast:Int = 1
                while index <= n {
                    current = (last + lastLast) % 1000000007
                    lastLast = last
                    last = current
                    
                    index += 1
                }
                return current
            }
            
            // dp 解法 超时
//            if n == 0 || n == 1 {
//                return 1
//            } else if n == 2 {
//                return 2
//            } else {
//                return (numWays(n - 1) + numWays(n - 2))
//            }
        }
    }