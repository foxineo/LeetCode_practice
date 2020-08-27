    /*
     快速排序（升序）
     通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序。
     整个排序过程可以递归进行，以此达到整个数据变成有序序列。
    */
    func quickSort(_ order: inout [Int]) {

       guard order.count > 1 else {
           return;
       }
       quick(&order, 0, order.count - 1)
    }

    func quick(_ array: inout [Int], _ low: Int, _ high: Int) {
       if low > high {
           return
       }

       let index: Int = partition(&array, low, high)
       quick(&array, low, index - 1)
       quick(&array, index + 1, high)
    }

    func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
       
       let target: Int = array[high]
       var i: Int = low

        for j in low...high {
           if array[j] < target {
               let tmp: Int = array[j]
               array[j] = array[i]
               array[i] = tmp

               i += 1
           }
       }
       array[high] = array[i]
       array[i] = target

       return i
    }
}

let arr:[[Int]] = [
           [1, 2],
           [1,4,2,7,5,7],
           [3],
           [9,4],
           [9,8,7,6,3],
           [5,6]
        ]

for tmpArr in arr {

   var unsorted: [Int] = tmpArr
   print(unsorted)
   
   quickSort(&unsorted)
   print("\(unsorted)\n")
}