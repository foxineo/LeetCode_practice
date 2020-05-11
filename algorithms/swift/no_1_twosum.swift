/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


/*
 方法一：暴力解法
 
 class Soulution {
     func twoSum(_ nums:[Int], _ target:Int) -> [Int] {
         var res:[Int] = Array.init(repeating: 0, count: 2);
         
         var i:Int = 0, j:Int = 0
         
         while i <= nums.count - 2 {
             let i_value = nums[i]
             
             j = i + 1
             while j <= nums.count - 1 {
                 let j_value = nums[j]
                 
                 if i_value + j_value == target {
                     res = [i, j]
                 }
                 j += 1
             }
             i += 1
         }
         return res;
     }
 }
 */


/*
 方法二：字典解法
 */
class Soulution {
    func twoSum(_ nums:[Int], _ target:Int) -> [Int] {
        var dic:[Int: Int] = [:]
        for (index, value) in nums.enumerated() {
            let remain = target - value
            
            if dic.keys.contains(remain) {
                return dic[remain]! > index ?  [index, dic[remain]!] : [dic[remain]!, index,]
            }
            dic[value] = index
        }
        return []
    }
}

let nums = [2, 7, 11, 15], target = 26
Soulution.init().twoSum(nums, target)
