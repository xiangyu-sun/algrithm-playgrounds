import UIKit

func makeTheChange(coins: [Int], money: Int, memo: inout [String : Int], index: Int = 0) -> Int {

    guard money > 0 else { return 1 }
    guard index < coins.count else { return 0 }
    
    var amountWithCoins = 0
    var ways = 0
    
    let memoKey = "\(money)-\(index)"
    if let memoWays = memo[memoKey] {
        return memoWays
    }
    
    while amountWithCoins <= money {
        let remain = money - amountWithCoins
        ways += makeTheChange(coins: coins, money: remain, memo: &memo, index: index + 1)
        amountWithCoins += coins[index]
    }
    
    memo[memoKey] = ways
    
    return ways
}

var memo:  [String : Int] = [:]
makeTheChange(coins: [25,10,5,1], money: 55, memo: &memo)
