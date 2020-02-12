import Foundation

extension TreeNode: CustomStringConvertible{
    public var description: String {
        return String(val)
    }
}

extension Optional where Wrapped == TreeNode {
    public typealias NodePathString = String
    /// Performance plus because string joining is already put into recursion
    ///
    /// - Parameter path:
    /// - Returns:
    public func getToLeafPath(_ path: [NodePathString]) -> [NodePathString] {
        guard let node = self else { return []}
        var currentPath = path
        currentPath.append(node.description)
        
        if node.isLeaf {
            return [currentPath.joined(separator: "->")]
        } else {
            // joining two arrays
            return node.left.getToLeafPath(currentPath) + node.right.getToLeafPath(currentPath)
        }
        
    }
    
    public typealias NodePath = [TreeNode]
    
    public func getToLeafPath(_ path: [TreeNode]) -> [NodePath] {
        guard let node = self else { return []}
        var currentPath = path
        currentPath.append(node)
        
        if node.isLeaf {
            return [currentPath]
        } else {
            return node.left.getToLeafPath(currentPath) + node.right.getToLeafPath(currentPath)
        }
    }
}

extension Array where Element == TreeNode {
    func joined() -> String {
        return map{$0.description}.joined(separator: "->")
    }
}

