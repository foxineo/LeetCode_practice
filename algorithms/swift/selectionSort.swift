/*
     选择排序（升序）
     第一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，然后再从剩余的未排序元素中寻找到最小（大）元素，然后放到已排序的序列的末尾。以此类推，直到全部待排序的数据元素的个数为零。选择排序是不稳定的排序方法。
    */
    func selectionSort(_ order: [Int]) -> [Int]{
        guard order.count > 1 else {
            return order
        }
        
        var sorted: [Int] = order
        for i in 0..<sorted.count - 1 {
            
            var minIndex: Int = i
            for j in i..<sorted.count {
                if sorted[j] < sorted[minIndex] {
                    minIndex = j
                }
            }
            
            if minIndex != i {
                sorted.swapAt(i, minIndex)
            }
        }
        
        return sorted
    }