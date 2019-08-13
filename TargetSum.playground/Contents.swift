import UIKit

func backtrack(_ nums: [Int], _ index: Int, _ sum: Int ,_ S: Int) -> Int{
    if index == nums.count {
        return sum  == S ? 1 : 0
    }
    return backtrack(nums, index + 1, sum + nums[index], S)
        + backtrack(nums, index + 1, sum - nums[index], S)
    
}
func findTargetSumWays1(_ nums: [Int], _ S: Int) -> Int {
    var memo = [[Int]](repeating: [Int](repeating: Int.min, count: 2001), count:nums.count)
    return calculate(nums, 0, 0, S, memo: &memo)
}
func calculate(_ nums: [Int], _ index: Int, _ sum: Int ,_ S: Int, memo: inout [[Int]]) -> Int{
    if index == nums.count {
        return sum  == S ? 1 : 0
    } else {
        if memo[index][sum + 1000] != Int.min {
            return memo[index][sum + 1000]
        }
        let add = calculate(nums, index + 1, sum + nums[index], S, memo: &memo)
        let sub = calculate(nums, index + 1, sum - nums[index], S, memo: &memo)
        memo[index][sum + 1000] = add + sub
        return memo[index][sum + 1000]
        
    }
}


func findTargetSumWaysDp(_ nums: [Int], _ S: Int) -> Int {
    var sum = 0
    sum = nums.reduce(0,+)
    
    if S > sum || -S < -sum {
        return 0
    }
    
    var dp = [Int](repeating: 0, count: sum * 2 + 1)
    dp[sum] = 1
    
    nums.forEach { (num) in
        var next = [Int](repeating: 0, count: sum * 2 + 1)
        dp.enumerated().forEach { (offset, element) in
            if dp[offset] == 0 {
                return
            }
            next[offset + num] += dp[offset]
            next[offset - num] += dp[offset]
        }
        dp = next
    }
    return dp[sum + S]
}

func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    var sum = 0
    sum = nums.reduce(0,+)
    
    if S > sum || -S < -sum || (S + sum) % 2 == 1 {
        return 0
    }
    
    var dp = [Int](repeating: 0, count: (S + sum) / 2 + 1)
    dp[0] = 1
    
    nums.forEach { (num) in
        
        for i in  (num...(dp.count - 1)).reversed() {
            dp[i] += dp[i - num]
        }
    }
    return dp.last!
}

func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    var sum = 0
    sum = nums.reduce(0,+)
    
    if S > sum || -S < -sum || (S + sum) % 2 == 1 {
        return 0
    }
    
    var dp = [Int](repeating: 0, count: (S + sum) / 2 + 1)
    dp[0] = 1
    print(S, sum, dp.count)
    nums.forEach { (num) in
        guard dp.count >= num else {return}
        for i in  (num..<dp.count).reversed() {
            dp[i] += dp[i - num]
        }
    }
    return dp.last!
}

findTargetSumWays([1,1,1,1,1], 3)
