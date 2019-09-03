import UIKit

func pageCount(n: Int, p: Int) -> Int {

    var start = p
    var end = p
    
    var num = 0
    
    
    
    while start > 1 && end < (n - n % 2) {
        
        start -= 2
        end += 2
        
        num += 1
        
        if start <= 1 {
            break
        }
        
        if end >= n {
            break
        }
    }
    return num
}
