import Foundation


public extension Optional where Wrapped == TreeNode {
    var minDepth: Int {
        guard let node = self else {
            return 0
        }
        
        guard node.left != nil || node.right != nil else { return 1 }
        
        if node.left == nil {
            return node.right.minDepth + 1
        }
        
        if node.right == nil {
            return node.left.minDepth + 1
        }
        
        return min(node.left.minDepth, node.right.minDepth) + 1
    }
    
    var maxDepth: Int {
        guard let node = self else {
            return 0
        }
        
        guard node.left != nil || node.right != nil else { return 1 }
        
        if node.left == nil {
            return node.right.maxDepth + 1
        }
        
        if node.right == nil {
            return node.left.maxDepth + 1
        }
        
        return max(node.left.maxDepth , node.right.maxDepth) + 1
    }

}

extension Optional where Wrapped == Int {
    static func + (lhs: Int?, rhs: Int) -> Int {
        return (lhs ?? 0) + rhs
    }
}
