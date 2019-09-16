import UIKit


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    
    var lookup = [Int : Int]()
    for (offset,element) in nums.enumerated() {
        
        let conter = target - element
        if let pair = lookup[conter], pair != offset {
            result.append(pair)
            result.append(offset)
            break
        }
        
        lookup[element] = offset
    }
    
    return result
}

func twoSumTwoPointer(_ numbers: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    
    var start = 0
    var end = numbers.count - 1
    
    while start < end {
        let sum = numbers[start] + numbers[end]
        
        if sum == target {
            result.append(start)
            result.append(end)
            start += 1
            end -= 1
        } else if sum < target {
            start += 1
        } else {
            end -= 1
        }
    }
    return result
}

print(twoSumTwoPointer([2,7,11,15], 9))
