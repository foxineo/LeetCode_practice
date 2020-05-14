

/*
 240. 搜索二维矩阵 II
 编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：

 每行的元素从左到右升序排列。
 每列的元素从上到下升序排列。
 示例:

 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。

 给定 target = 20，返回 false。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-a-2d-matrix-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        if (matrix.count == 1 && matrix.first?.count == 0) {
            return false
        }
        
        for row in matrix {
            if !row.contains(target) {
                continue
            }
            
            var left:Int = 0, right:Int = row.count - 1, mid:Int
            
            while true {
                if left > right {
                    print("error, break")
                    break
                }
                mid = left + (right - left) >> 1
                if row[mid] > target {
                    right = mid - 1
                } else if row[mid] < target {
                    left = mid + 1
                } else {
                    return true
                }
            }
        }
        return false
    }
}
