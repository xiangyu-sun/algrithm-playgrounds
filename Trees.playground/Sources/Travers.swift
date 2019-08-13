import Foundation

extension Optional where Wrapped == TreeNode {
    
    func traversal() -> [[Int]] {
        return Array(0..<self.maxDepth).reversed().map{ findLevel(in: self, level: $0)}
    }
    
    func findLevel(in node: TreeNode?, level: Int) -> [Int] {
        guard let anode = node else { return [] }
        
        if level == 1 {
            return [anode.val]
        } else  {
            return findLevel(in: anode.left, level: level - 1) +
                findLevel(in: anode.right, level: level - 1)
        }
    }
}

