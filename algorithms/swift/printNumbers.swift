/*
     剑指 Offer 17. 打印从1到最大的n位数
     输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。
     
     示例 1:
     
     输入: n = 1
     输出: [1,2,3,4,5,6,7,8,9]
     
     
     说明：
     
     用返回一个整数列表来代替打印
     n 为正整数
     
     */
    
    func printNumbers(_ n: Int) -> [Int] {
        
        var max: Int = 1
        
        var index: Int = n
        while index > 0 {
            max = max * 10
            index = index - 1
        }
        
        var ret:[Int] = []
        
        for item in 1...max - 1 {
            ret.append(item)
        }
        return ret;
    }