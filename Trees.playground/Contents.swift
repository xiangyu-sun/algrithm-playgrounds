import Foundation

extension TreeNode: CustomStringConvertible{
    public var description: String {
        return String(val)
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
}




