import Foundation


public extension Optional where Wrapped == TreeNode {
    /// alwasy checking left and right
    /// abs of depth needs to be le then 1
    var isBalanced: Bool {
        guard let node = self else {
            return true
        }
        return node.left.isBalanced && node.right.isBalanced && abs(node.left.maxDepth - node.right.maxDepth) <= 1
    }
}
