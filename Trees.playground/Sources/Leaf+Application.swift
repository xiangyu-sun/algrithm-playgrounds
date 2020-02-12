import Foundation
/*:

****
# Path to leaf sumup to a value

*/

extension Optional where Wrapped == TreeNode {
    
    /// += is a replacement for append of array
    /// - Parameters:
    ///   - currentSum:
    ///   - sum:
    public func getToLeafPath(_ currentSum: Int, sum: Int) -> Bool {
        guard let node = self else { return false}
        var currentSum = currentSum
        currentSum += node.val
        if node.isLeaf {
            return currentSum == sum
        } else {
            return node.left.getToLeafPath(currentSum, sum: sum) || node.right.getToLeafPath(currentSum, sum: sum)
        }
    }
    
    /// get the path on the wau
    public func getToLeafPath(_ path: [Int],  currentSum: Int, sum: Int) -> [[Int]] {
        guard let node = self else { return []}
        
        var currentSum = currentSum
        currentSum += node.val
        
        var currentPath = path
        currentPath.append(node.val)
        
        if node.isLeaf {
            if currentSum == sum {
                return [currentPath]
            }
            return []
        } else {
            return node.left.getToLeafPath(currentPath, currentSum: currentSum, sum: sum)
                + node.right.getToLeafPath(currentPath, currentSum: currentSum, sum: sum)
        }
    }
    
    /// MEMO
    /// - Parameters:
    ///   - sum: <#sum description#>
    ///   - path: <#path description#>
    ///   - sumMemo: <#sumMemo description#>
    public func getToLeafPath(sum: Int, previousPath: [Int] = [], sumMemo: [Int] = []) -> Int {
        guard let node = self else { return 0 }
        
        var appearanceCount = 0
        // first time it will just be empty
        // add current num for all the sum in memo
        var updatedMemo = sumMemo.map{ previousSum -> Int in
            let sum1 = previousSum + node.val
            
            if sum == sum1 {
                appearanceCount += 1
            }
            
            return sum1
        }
        
        // add current value into memo
        updatedMemo.append(node.val)
        
        
        if node.val == sum {
            appearanceCount += 1
        }
        
        var currentPath = previousPath
        currentPath.append(node.val)
        
        
        if node.isLeaf {
            return appearanceCount
        } else {
            return node.left.getToLeafPath( sum: sum, previousPath: currentPath, sumMemo: updatedMemo)
                + node.right.getToLeafPath( sum: sum, previousPath: currentPath, sumMemo: updatedMemo) + appearanceCount
        }
    }
}
