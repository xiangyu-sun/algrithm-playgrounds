/*:

****
# Thre sum

Find three different element in one array sums to 0

*/

import Foundation


/// brutal force
/// - Parameter array:

func find3Sum(_ array: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
    
    // i j k needs to be different
    for (iindex, i) in array.enumerated() {
        for (jindex, j) in array.enumerated() where jindex != iindex {
            for (kindex, k) in array.enumerated() where kindex != jindex && kindex != iindex {
                if i + j + k == 0 {
                    result.insert([i,j,k])
                }
            }
        }
    }
    return Array(result)
}
find3Sum([-1,0,1,2,-1,-4])



/// two pointer use a sort to optmize algrithm, 
/// - Parameter array:
func find3SumTwoPointers(_ array: [Int]) -> [[Int]] {
    
    let sortedArray = array.sorted()
    
    var result = [[Int]]()
    
    var a: Int,b: Int, c: Int
    
    var start: Int, end: Int
    
    /// performing two pointer exluding a
    for (index, i) in sortedArray.enumerated() {
        
        // exluded a array end index becoming count - 2
        guard index <= sortedArray.count - 2 else { break }
        
        a = i
        
        // b
        start = index + 1
        
        //c
        end = sortedArray.count - 1
        
        // 1. when start == end finish the iteration , start = max - 2
        // 2. sum > 0 means end element is too big, move end forward
        // 3. sum < 0 means start element is too small, move start forward
        // 4. continue if find one =0, until they meet
        while start < end {
            b = sortedArray[start]
            c = sortedArray[end]
            
            let sum = a + b + c
            
            if sum == 0 {
                result.append([a,b,c])
                start += 1
                end -= 1
            } else if sum > 0 {
                end -= 1
            } else {
                start += 1
            }
        }
    }
    return result
}


find3SumTwoPointers([-1,0,1,2,-1,-4])
