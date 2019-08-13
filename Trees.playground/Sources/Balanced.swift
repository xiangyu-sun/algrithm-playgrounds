import Foundation


public extension Optional where Wrapped == TreeNode {
    var isBalanced: Bool {
        guard let node = self else {
            return true
        }
        return node.left.isBalanced && node.right.isBalanced && abs(node.left.maxDepth - node.right.maxDepth) <= 1
    }
}
