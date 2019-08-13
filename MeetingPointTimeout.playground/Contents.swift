

func minTotalDistanceIteration(_ grid: [[Int]]) -> Int {
    var minDis = Int.max
    for row in 0..<grid.count {
        for coloum in 0..<grid[0].count {
            minDis = min(distanceIteration(grid: grid, row: row, colum: coloum), minDis)
        }
    }
    
    return minDis
}


func distanceIteration(grid: [[Int]], row: Int, colum: Int) -> Int {
    var q = [(row: Int, colum:Int, distance: Int)]()
    let m = grid.count
    let n = grid[0].count
    
    var visitTable = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    
    q.append((row, colum, 0))
    var totalDistance = 0
    
    while !q.isEmpty {
        
        let point = q.removeFirst()
        guard point.row >= 0 , point.colum >= 0, point.row < m, point.colum < n,
            !visitTable[point.row][point.colum] else {
                continue
        }
        
        if grid[point.row][point.colum] == 1 {
            totalDistance += point.distance
            
        }
        visitTable[point.row][point.colum] = true
        
        q.append((point.row + 1, point.colum, point.distance + 1))
        q.append((point.row - 1, point.colum, point.distance + 1))
        q.append((point.row, point.colum + 1, point.distance + 1))
        q.append((point.row, point.colum - 1, point.distance + 1))
    }
    return totalDistance
}


func minTotalDistanceMDF(_ grid: [[Int]]) -> Int {
    var minDis = Int.max
    let allPoint = getAllPoint(grid: grid)
    for row in 0..<grid.count {
        for coloum in 0..<grid[0].count {
            minDis = min(calculateDistance(allPoints: allPoint, row: row, column: coloum), minDis)
        }
    }
    
    return minDis
}


func calculateDistance(allPoints: [(Int, Int)], row: Int,column: Int) -> Int {
    var dist = 0
    
    allPoints.forEach { (prow, pcolumn) in
        dist += abs(prow - row) + (pcolumn - column)
    }
    return dist
}




func getAllPoint(grid: [[Int]]) -> [ (row: Int, colum:Int)] {
    var points = [ (row: Int, colum:Int)]()
    for row in 0..<grid.count {
        for coloum in 0..<grid[0].count {
            if grid[row][coloum] == 1 {
                points.append((row, coloum))
            }
        }
    }
    return points
}

