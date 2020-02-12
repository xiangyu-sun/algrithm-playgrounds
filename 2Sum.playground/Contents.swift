import UIKit

// Find the first match of two int sum to the target input

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    
    var lookup = [Int : Int]()
    for (index,element) in nums.enumerated() {
        
        let conterPart = target - element
        
        // saw it before and that's not current element
        if let counterPartIndex = lookup[conterPart], counterPartIndex != index {
            result.append(counterPartIndex)
            result.append(index)
            break
        }
        
        // normal case
        // save current element in lookup and value is it's index
        lookup[element] = index
    }
    
    return result
}

print(twoSum([2,7,11,15], 9))
print(twoSum([2,7,-2,11,15], 9))


// Find all the match of two int sum to the target input

func twoSumTwoPointer(_ numbers: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    
    var start = 0
    // index of end
    var end = numbers.count - 1
    
    // start from two end find the match
    while start < end {
        let sum = numbers[start] + numbers[end]
        
        // bingo
        if sum == target {
            result.append(start)
            result.append(end)
            start += 1
            end -= 1
        } else if sum < target { // expecting a sorted array so we can sur to move start to end
            start += 1
        } else { // expecting a sorted array so we can sur to move end to start
            end -= 1
        }
    }
    return result
}

print(twoSumTwoPointer([-2,2,7,11,15], 9))
