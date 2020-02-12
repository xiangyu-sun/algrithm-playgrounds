import Foundation

extension Optional where Wrapped == TreeNode {
    
    func invert() -> TreeNode? {
        guard self != nil else  { return nil }
        
        let selfCopy = self
        let left = self?.left.invert()
        let right = self?.right.invert()
        
        selfCopy?.left = right
        selfCopy?.right = left
        return selfCopy
    }
}

