import Foundation

struct Point: CustomDebugStringConvertible {
    let row: Int
    let column: Int
    let distance: Int
    
    var debugDescription: String {
        return "\(row) - \(column)"
    }
}

func shortestDistance(_ grid: [[Int]]) -> Int {

    var distance = [Int.max]
    let totalBuildings = numberOfBuildings(grid: grid)
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            let current = distanceOf(grid: grid, startRow: row, startColumn: column)
            guard totalBuildings == current.count else { continue }
            let sum = current.reduce(0, +)
            if sum != 0, sum < distance.reduce(0, +) {
                distance = current
            }
        }
    }
    
    let minDist = distance.reduce(0, +)
    
    guard totalBuildings == distance.count else { return -1 }
    guard minDist != 0 else { return -1 }
    guard minDist != Int.max else { return -1 }
    
    return minDist
}


func numberOfBuildings(grid: [[Int]]) -> Int {
    var totalBuildings = 0
    for row in 0..<grid.count {
         for column in 0..<grid[0].count {
             if grid[row][column] == 1 {
                 totalBuildings += 1
             }
 
         }
     }
    return totalBuildings
}

func distanceOf(grid: [[Int]], startRow: Int, startColumn: Int) -> [Int] {
    guard grid[startRow][startColumn] < 1 else {
        return [Int.max]
    }
    
    var visitTable = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
    var q: [Point] = []
    
    let startingPoint = Point(row: startRow, column: startColumn, distance: 0)
    q.append(startingPoint)
    var totalDistance = [Int]()

    while !q.isEmpty {
        let currentPoint = q.removeFirst()

        guard currentPoint.column < grid[0].count && currentPoint.row < grid.count, currentPoint.row >= 0, currentPoint.column >= 0 else {
            continue
        }
        
        guard grid[currentPoint.row][currentPoint.column] != 2 else { continue }
        guard !visitTable[currentPoint.row][currentPoint.column]  else { continue }
        
        
        visitTable[currentPoint.row][currentPoint.column] = true
  
        if grid[currentPoint.row][currentPoint.column] == 1 {
            totalDistance.append(currentPoint.distance)
        } else {
            q.append(contentsOf: [
                Point(row: currentPoint.row + 1, column: currentPoint.column, distance: currentPoint.distance + 1),
                Point(row: currentPoint.row - 1, column: currentPoint.column, distance: currentPoint.distance + 1),
                Point(row: currentPoint.row, column: currentPoint.column + 1, distance: currentPoint.distance + 1),
                Point(row: currentPoint.row, column: currentPoint.column - 1, distance: currentPoint.distance + 1)
            ])
        }
    }
 
    return totalDistance
}


shortestDistance([[1,1,1,1,1,0],[0,0,0,0,0,1],[0,1,1,0,0,1],[1,0,0,1,0,1],[1,0,1,0,0,1],[1,0,0,0,0,1],[0,1,1,1,1,0]])
