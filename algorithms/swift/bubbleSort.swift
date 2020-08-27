/**
	冒泡排序（升序）
	在每一轮排序过程中，依次比较相邻元素的大小，如果顺序不满足排序的要求，则交换这两个元素。
	这样每一轮排序结束后，都能将最大的元素的元素放到最后。
*/

 func bubbleSort(_ unsortedArray: [Int]) -> [Int] {
 	guard unsortedArray.count > 1 else {
 		return unsortedArray;
 	}	

 	var retArr: [Int] = unsortedArray

 	let count:Int = retArr.count
 	for i in 0..<count {

 		var swapped: Bool = false
 		for j in 0..<count - 1 - i {
 			if retArr[j] > retArr[j + 1] {
 				let tmp: Int = retArr[j]
 				retArr[j] = retArr[j + 1]
 				retArr[j + 1] = tmp
 				swapped = true
 			}
 		}
 		if swapped == false {
 			break
 		}
 	}
 	return retArr;
 }

 let arr:[[Int]] = [
 	[1, 2],
 	[1,4,2,7,5,7],
 	[3],
 	[9,4],
 	[5,6]
 ]

 for tmpArr in arr {
 	print(tmpArr)
 	print("\(bubbleSort(tmpArr))\n")
 }