import Foundation


class LRUCache {
    private var hitcache: [Int: Int]
    private var cache: [Int: Int]
    let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
        hitcache = [Int: Int]()
        cache = [Int: Int]()
    }
    
    func get(_ key: Int) -> Int {
        return valueForKey(key)
    }
    
    func put(_ key: Int, _ value: Int) {
        if cache.count >= capacity {
            var smallest = Int.max
            var least = 0
            hitcache.forEach{
                if $1 < smallest {
                    smallest = $1
                    least = $0
                }
            }
            hitcache.removeValue(forKey: least)
            cache.removeValue(forKey: least)
        }
        
        if hitcache[key] == nil {
            hitcache[key] = 0
        }
        
        cache[key] = value
    }
    
    
    func valueForKey(_ key: Int) -> Int {
        if let value = cache[key], let count = hitcache[key] {
            hitcache[key] = count + 1
            return value
        }else {
            return -1
        }
    }
}
