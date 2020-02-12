import Foundation

extension Optional where Wrapped == Int {
    static func + (lhs: Int?, rhs: Int) -> Int {
        return (lhs ?? 0) + rhs
    }
}
