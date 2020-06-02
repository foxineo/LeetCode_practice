/*
     面试题12. 矩阵中的路径
     请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

     [["a","b","c","e"],
     ["s","f","c","s"],
     ["a","d","e","e"]]

     但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

      

     示例 1：

     输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
     输出：true
     示例 2：

     输入：board = [["a","b"],["c","d"]], word = "abcd"
     输出：false
     提示：

     1 <= board.length <= 200
     1 <= board[i].length <= 200
     注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/
     */
    
    func check(_ character: Character, _ position:(Int, Int), _ board:[[Character]]) -> Bool {
            if character == board[position.0][position.1] {
                return true
            } else {
                return false
            }
        }
    
    func positionIsValid(_ position:(Int, Int), _ board:[[Character]]) -> Bool {
        let ret:Bool = position.0 >= 0 && position.1 >= 0 && position.0 < board.count && position.1 < board.first!.count
        return ret
    }
        
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var y:Int = 0
        
        if (board.count == 1 && board.first!.count == 1 && word.count == 1 && board[0][0] == word.first!) {
            return true
        }
        
        let wordArray:[Character] = word.map{$0}
        var remainCharacters:[Character] = wordArray
        remainCharacters.removeFirst()
        
        while y < board.count {
            let tmpY:[Character] = board[y]
            
            var firstIndex:[Int] = [];
            for indexX in 0...tmpY.count - 1 {
                if tmpY[indexX] == wordArray.first! {
                    firstIndex.append(indexX)
                }
            }
            
            for firstX in firstIndex {
                var visited:[String:Int] = [:]
                visited["\(y)-\(firstX)"] = 1
                
                let current = (y, firstX)
                
                let ret: Bool = backtrack(remainCharacters, board, current, visited)
                if ret {
                    return true
                }
            }
            
            y += 1
        }

        return false
    }
    
    func backtrack(_ remainChars:[Character], _ board:[[Character]], _ current:(Int, Int), _ visited:[String:Int]) -> Bool {
        
        var tmpVisited:[String:Int] = visited
        var tmpRemainChars:[Character] = remainChars
        
        if tmpRemainChars.count == 0 {
            return true
        }
        
        let top     = (current.0 - 1, current.1)
        let left    = (current.0, current.1 - 1)
        let bottom  = (current.0 + 1, current.1)
        let right   = (current.0, current.1 + 1)
        
        let topKey:String       = "\(top.0)-\(top.1)"
        let leftKey:String      = "\(left.0)-\(left.1)"
        let bottomKey:String    = "\(bottom.0)-\(bottom.1)"
        let rightKey:String     = "\(right.0)-\(right.1)"
        
        let checkChar: Character = tmpRemainChars.first!
        tmpRemainChars.removeFirst()
        
        var retBool:Bool = false
        if self.positionIsValid(top, board) && tmpVisited[topKey] == nil && self.check(checkChar, top, board) {
            tmpVisited[topKey] = 1
            retBool = backtrack(tmpRemainChars, board, top, tmpVisited)
            if !retBool {
                tmpVisited.removeValue(forKey: topKey)
            }
        }
        
        if !retBool {
            if self.positionIsValid(left, board) && tmpVisited[leftKey] == nil && self.check(checkChar, left, board) {
                tmpVisited[leftKey] = 1
                retBool = backtrack(tmpRemainChars, board, left, tmpVisited)
                if !retBool {
                    tmpVisited.removeValue(forKey: leftKey)
                }
            }
        }
        
        if !retBool {
            if self.positionIsValid(bottom, board) && tmpVisited[bottomKey] == nil && self.check(checkChar, bottom, board) {
                tmpVisited[bottomKey] = 1
                retBool = backtrack(tmpRemainChars, board, bottom, tmpVisited)
                if !retBool {
                    tmpVisited.removeValue(forKey: bottomKey)
                }
            }
        }
        
        if !retBool {
            if self.positionIsValid(right, board) && tmpVisited[rightKey] == nil && self.check(checkChar, right, board) {
                tmpVisited[rightKey] = 1
                retBool = backtrack(tmpRemainChars, board, right, tmpVisited)
                if !retBool {
                    tmpVisited.removeValue(forKey: rightKey)
                }
            }
        }
        
        return retBool
    }