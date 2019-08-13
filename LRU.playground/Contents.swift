import Foundation



class LRUCache {
    private var recentCache: [Int: Int]
    private var cache: [Int: Int]
    private var age = 0
    let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
        recentCache = [Int : Int ]()
        cache = [Int: Int]()
    }
    
    func get(_ key: Int) -> Int {
        return valueForKey(key)
    }
    func put(_ key: Int, _ value: Int) {
        if cache.count >= capacity && cache[key] == nil {
            let first = recentCache.min{ $0.value < $1.value }!
            cache.removeValue(forKey: first.key)
            recentCache.removeValue(forKey: first.key)
        }
        
        updateAge(key)
   
        cache[key] = value

    }
    
    func valueForKey(_ key: Int) -> Int {
        if let value = cache[key] {
            updateAge(key)
            return value
        }else {
            return -1
        }
    }
    
    func updateAge(_ key: Int) {
        recentCache[key] = age
        age += 1
    }
}

//
//class LRUCache {
//    private var recentCache: [Int]
//    private var cache: [Int: Int]
//    let capacity: Int
//    init(_ capacity: Int) {
//        self.capacity = capacity
//        recentCache = [Int]()
//        cache = [Int: Int]()
//    }
//
//    func get(_ key: Int) -> Int {
//        return valueForKey(key)
//    }
//    func put(_ key: Int, _ value: Int) {
//        if cache.count >= capacity && cache[key] == nil {
//            let first = recentCache.removeFirst()
//            cache.removeValue(forKey: first)
//        }
//
//
//        if cache[key] == nil {
//            recentCache.append(key)
//        } else {
//            let recentCacheIndex = recentCache.firstIndex{ $0 == key }
//
//            recentCache.append(recentCache.remove(at: recentCacheIndex!))
//        }
//
//        cache[key] = value
//
//    }
//
//    func valueForKey(_ key: Int) -> Int {
//        if let value = cache[key] {
//            let recentCacheIndex = recentCache.firstIndex{ $0 == key }
//
//            recentCache.append(recentCache.remove(at: recentCacheIndex!))
//            return value
//        }else {
//            return -1
//        }
//    }
//}
