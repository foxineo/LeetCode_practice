/*
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。
  

 示例:

 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 输出：
 [null,null,null,null,-3,null,0,-2]

 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
 
 提示：

 pop、top 和 getMin 操作总是在 非空栈 上调用。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-stack
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


class MinStack {
    var stack:Array<Int>;
    var minStack:Array<Int>;
    
    
    /** initialize your data structure here. */
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x);
        
        let min = minStack.last
        if min == nil || min! > x {
            minStack.append(x)
        }
    }
    
    func pop() {
        
        let minValue = minStack.last!
        let x = stack.removeLast()
                
        if x == minValue {
            if !(stack.contains(minValue)) {
                minStack.removeLast()
            }
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}


let obj = MinStack()
obj.push(0)
obj.push(1)
obj.push(0)
obj.getMin()
obj.pop()
obj.getMin()
 
