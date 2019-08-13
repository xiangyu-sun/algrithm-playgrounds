import UIKit


func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var result = arr.sorted{ abs($0 - x) < abs($1 - x)  }
    return result[0..<k].sorted()
}

