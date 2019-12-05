
https://leetcode-cn.com/problems/binary-search/


def search(nums: list, target: int) -> int:A
    low = 0
    high = len(nums) - 1

    while low <= high:
        mid = (low + high) / 2
        guess = nums[int(mid)]
        print(guess)

        if guess == target:
            return guess

        if guess < target:
            low = mid + 1
        else:
            high = mid - 1

    return -1



resutl = search([-1,0,3,5,9,12], 9)
print(resutl)



