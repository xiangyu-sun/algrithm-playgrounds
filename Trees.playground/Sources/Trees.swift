
public class TreeNode {
    public var val: Int = Int.random(in: 0...100000)
    public var left: TreeNode?
    public var right: TreeNode?
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
}


