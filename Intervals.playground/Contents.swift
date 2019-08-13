    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        var i = 0, j = 0
        
        while i < A.count && j < B.count {
            let lo = max(A[i][0], B[j][0])
            
            let hi = min(A[i].last!, B[j].last!)
            
            if lo <= hi {
                ans.append([lo, hi])
            }
            
            if A[i].last! < B[j].last! {
                i += 1
            } else {
                j += 1
            }
        }
        return ans
        
    }
