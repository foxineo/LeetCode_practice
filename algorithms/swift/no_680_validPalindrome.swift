    /*
     680. 验证回文字符串 Ⅱ
     
     给定一个非空字符串 s，最多删除一个字符。判断是否能成为回文字符串。

     示例 1:

     输入: "aba"
     输出: True
     示例 2:

     输入: "abca"
     输出: True
     解释: 你可以删除c字符。
     注意:

     字符串只包含从 a-z 的小写字母。字符串的最大长度是50000。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/valid-palindrome-ii
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    
    func validPalindrome(_ s: String) -> Bool {
        
        if s.count <= 2 {
            return true
        }
        let arr:[String] = s.map{"\($0)"}
        var low:Int = 0, heigh:Int = arr.count - 1
        
        var hasDeleteLow = false
        var hasDeleteHeigh = false
        
        var diffIndex = 0
        while low < heigh {
            if arr[low] != arr[heigh] {
                if hasDeleteLow && hasDeleteHeigh {
                    return false
                }
                
                if hasDeleteLow == false {
                    diffIndex = low
                    hasDeleteLow = true
                    low += 1
                } else if hasDeleteHeigh == false {
                    low = diffIndex
                    heigh = arr.count - low - 1
                    hasDeleteHeigh = true
                    heigh -= 1
                }
                continue
            }
            low += 1
            heigh -= 1
        }
        return true
    }