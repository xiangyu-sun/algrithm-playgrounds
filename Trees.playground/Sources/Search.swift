import Foundation

public extension Optional where Wrapped == TreeNode {
    
    func search(_ val: Int) -> TreeNode? {
        guard let node = self else { return nil }
        
        if node.val == val {
            return node
        } else {
            return node.left.search(val) ?? node.right.search(val)
        }
    }
    
}

