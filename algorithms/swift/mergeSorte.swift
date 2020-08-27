    
/**
    归并排序（Merge Sort）是建立在归并操作上的一种有效，稳定的排序算法.
    该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。
    将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为二路归并。
*/
    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0

        var orderedPile = [Int]()

        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                orderedPile.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                orderedPile.append(right[rightIndex])
                rightIndex += 1
            } else {
              orderedPile.append(left[leftIndex])
              leftIndex += 1
              orderedPile.append(right[rightIndex])
              rightIndex += 1
            }
        }

        if leftIndex < left.count {
            orderedPile.append(contentsOf: Array(left[leftIndex..<left.count]))
        }
        
        if rightIndex < right.count {
            orderedPile.append(contentsOf: Array(right[rightIndex..<right.count]))
        }
        return orderedPile
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let middleIndex = array.count / 2

        let leftArray = mergeSort(Array(array[0..<middleIndex]))

        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))

        return merge(left: leftArray, right: rightArray)
    }