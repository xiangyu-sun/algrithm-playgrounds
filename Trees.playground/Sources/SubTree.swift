import Foundation

extension Optional where Wrapped == TreeNode {
    func contains(_ tree: TreeNode?) -> Bool {
        if self == nil && tree == nil {
            return true
        }
        
        if self == nil || tree == nil {
            return false
        }
        
        return self == tree || self?.left.contains(tree) == true || self?.right.contains(tree) == true
    }
}
