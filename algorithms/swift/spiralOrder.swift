/*
     https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof/
     剑指 Offer 29. 顺时针打印矩阵
     输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
     
     
     
     示例 1：
     
     输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
     输出：[1,2,3,6,9,8,7,4,5]
     示例 2：
     
     输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
     输出：[1,2,3,4,8,12,11,10,9,5,6,7]
     
     
     限制：
     
     0 <= matrix.length <= 100
     0 <= matrix[i].length <= 100
     注意：本题与主站 54 题相同：https://leetcode-cn.com/problems/spiral-matrix/
     */
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        
        var ret: [Int] = []
        
        let max_column: Int = matrix.first!.count
        let max_row: Int = matrix.count
        let total: Int = max_column * max_row
        
        var max_x: Int = max_column - 1
        var min_x: Int = 0
        var max_y: Int = max_row - 1
        var min_y: Int = 0
        
        // 对应 [max_x, min_x, max_y, min_y]
        let directionMatric: [[Int]] = [
            [0, 1, 0, 0],   // turn right
            [0, 0, 0, 1],   // turn down
            [-1, 0, 0, 0],  // turn left
            [0, 0, -1, 0],  // turn up
        ]
        
        var directionIndex: Int = 0
        var index_x: Int = 0
        var index_y: Int = 0
        
        var turnDirection: Bool = false
        
        while ret.count < total {
            
            ret.append(matrix[index_y][index_x])
            
            
            switch directionIndex {
            case 0: // right
                index_x = index_x + 1
                turnDirection = index_x >= max_x
                
                if index_x >= max_column {
                    index_x = max_column - 1
                    index_y += 1
                }
                break;
            case 1: // down
                index_y = index_y + 1
                turnDirection = index_y >= max_y
                
                if index_y >= max_row {
                    index_y = max_row - 1
                    index_x += 1
                }
                break;
            case 2: // left
                index_x = index_x - 1
                turnDirection = index_x <= min_x
                break;
            case 3: // up
                index_y = index_y - 1
                turnDirection =  index_y <= min_y
                break;
            default:
                break;
            }
            
            
            
            if turnDirection {
                directionIndex += 1
                if directionIndex == directionMatric.count {
                    directionIndex = 0
                }
                max_x += directionMatric[directionIndex][0]
                min_x += directionMatric[directionIndex][1]
                max_y += directionMatric[directionIndex][2]
                min_y += directionMatric[directionIndex][3]
            }
            
        }
        
        return ret
    }