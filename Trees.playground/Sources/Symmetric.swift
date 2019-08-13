import Foundation

extension TreeNode {
    public func isMirror(_ node: TreeNode) -> Bool {
        return val == node.val
            && left.isMirror(node.right)
            && right.isMirror(node.left)
    }
    
    
    public func linerSymmetric(_ root: TreeNode?) -> Bool {
        
        var tupleList = [(TreeNode?, TreeNode?)]()
        tupleList.append((root, root))
        
        while !tupleList.isEmpty {
            guard let (n1, n2) = tupleList.popLast() else {
                continue
            }
            if n1 == nil && n2 == nil {
                continue
            }
            guard let node1 = n1, let node2 = n2,
                node1.val == node2.val else {
                    return false
            }
            
            tupleList.append((node1.left, node2.right))
            tupleList.append((node1.right, node2.left))
            
        }
        return true
    }
}


extension Optional where Wrapped == TreeNode {
    
    public var isSymmetric: Bool {
        guard self != nil else {
            return true
        }
        return self.isMirror(self)
    }
    
    public func isMirror(_ node: TreeNode?) -> Bool {
        if self == nil , node == nil {
            return true
        }
        
        guard let unwrappedSelf = self, let otherNode = node else {
            return false
        }
        
        return unwrappedSelf.val == otherNode.val
            && unwrappedSelf.left.isMirror(otherNode.right)
            && unwrappedSelf.right.isMirror(otherNode.left)
    }
}
