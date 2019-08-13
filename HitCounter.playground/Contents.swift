import Foundation

class HitCounter {
    
    var hit: [Int]
    
    let queue =  DispatchQueue(label: "internal")
    
    /** Initialize your data structure here. */
    init() {
        hit = []
    }
    
    /** Record a hit.
     @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
        queue.sync {
            self.hit.append(timestamp)
        }
        
    }
    
    /** Return the number of hits in the past 5 minutes.
     @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
        let interval = (timestamp - 300)
        if interval > 0{
            queue.sync {
                if let index = self.hit.lastIndex(where: {$0 <= interval} ) {
                    self.hit.removeFirst(index + 1)
                }
            }
        }
        return queue.sync {
            return hit.count
        }
    }
}
