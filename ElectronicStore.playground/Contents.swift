
func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    let sortedKeyboard = keyboards.sorted()
    let sortedDrives = drives.sorted()
    
    var maxVal = -1
    for keyboard in sortedKeyboard.reversed() {
        guard keyboard < b else {
            continue
        }
        
        for drive in sortedDrives {
            let price = keyboard + drive
            guard price <= b else {
                    continue
            }
            
            if maxVal < price {
                maxVal = price
            }
        }
        
    }
    return maxVal
}
