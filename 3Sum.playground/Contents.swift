import Foundation


func find3Sum(_ array: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
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

func find3Sum1(_ array: [Int]) -> [[Int]] {
    var array = array.sorted()
    var result = [[Int]]()
    var a: Int,b: Int, c: Int
    var start: Int, end: Int
    for (index, i) in array.enumerated() {
        guard index <= array.count - 2 else { break }
        
        a = i
        start = index + 1
        end = array.count - 1
        
        while start < end {
            b = array[start]
            c = array[end]
            
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

find3Sum([-1,0,1,2,-1,-4])
find3Sum1([-1,0,1,2,-1,-4])
