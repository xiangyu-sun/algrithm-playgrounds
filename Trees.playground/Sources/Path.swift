import Foundation

extension TreeNode: CustomStringConvertible{
    public var description: String {
        return String(val)
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
}

extension Optional where Wrapped == TreeNode {
    
    
    /// Performance plus because string conccting is already put into recursion
    ///
    /// - Parameter path: <#path description#>
    /// - Returns: <#return value description#>
    public func getToLeafPath(_ path: [String]) -> [String] {
        guard let node = self else { return []}
        var currentPath = path
        currentPath.append(node.description)
        
        if node.isLeaf {
            return [currentPath.joined(separator: "->")]
        } else {
            return node.left.getToLeafPath(currentPath) + node.right.getToLeafPath(currentPath)
        }
        
    }
    
    
    public func getToLeafPath(_ path: [TreeNode]) -> [[TreeNode]] {
        guard let node = self else { return []}
        var currentPath = path
        currentPath.append(node)
        
        if node.isLeaf {
            return [currentPath]
        } else {
            return node.left.getToLeafPath(currentPath) + node.right.getToLeafPath(currentPath)
        }
    }
    
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
    
    
    public func getToLeafPath(sum: Int, path: [Int] = [], sumMemo: [Int] = []) -> Int {
        guard let node = self else { return 0 }
        
        var appearance = 0
        var newSum = sumMemo.map{ num -> Int in
            let sum1 = num + node.val
            if sum == sum1 {
                appearance += 1
            }
            return sum1
        }
        newSum.append(node.val)
        
        if node.val == sum {
            appearance += 1
        }
        
        var currentPath = path
        currentPath.append(node.val)
        
        if node.isLeaf {
            return appearance
        } else {
            return node.left.getToLeafPath( sum: sum, path: currentPath, sumMemo: newSum)
                + node.right.getToLeafPath( sum: sum, path: currentPath, sumMemo: newSum) + appearance
        }
    }
    
    
    
}

extension Array where Element == TreeNode {
    func joined() -> String {
        return map{$0.description}.joined(separator: "->")
    }
}
