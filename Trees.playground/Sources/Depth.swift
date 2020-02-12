import Foundation


public extension Optional where Wrapped == TreeNode {
    
    //return 1 as current depth
    var minDepth: Int {
        guard let node = self else {
            return 0
        }
        
        // both empty
        guard node.left != nil || node.right != nil else { return 1 }
        
        if node.left == nil {
            return node.right.minDepth + 1
        }
        
        if node.right == nil {
            return node.left.minDepth + 1
        }
        
        // min of left for right children
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
