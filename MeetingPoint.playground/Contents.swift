import Foundation
func minTotalDistanceMedian(_ grid: [[Int]]) -> Int {
    var rows = [Int]()
    var columns = [Int]()
    
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            if grid[row][column] == 1 {
                rows.append(row)
                columns.append(column)
            }
        }
    }
    print(rows)
    print(columns)
    let row = rows[rows.count / 2]
    columns.sort()
    let column = columns[columns.count / 2]
    let minRow = minDistance(allPoints: rows, origin: row)
    let mindcolum = minDistance(allPoints: columns, origin: column)
    return minRow + mindcolum
}


func minDistance(allPoints: [Int], origin: Int) -> Int {
    var dist = 0
    allPoints.forEach { point in
        dist += abs(point - origin)
    }
    return dist
}


func minTotalDistance(_ grid: [[Int]]) -> Int {
    var rows = collectRow(grid)
    var columns = collectColumn(grid)
    
    let row = rows[rows.count / 2]
    let column = columns[columns.count / 2]
    
    let minRow = minDistance(allPoints: rows, origin: row)
    let mindcolum = minDistance(allPoints: columns, origin: column)
    
    return minRow + mindcolum
}

func collectColumn(_ grid:[[Int]]) -> [Int] {
    var colums = [Int]()
    for column in 0..<grid[0].count {
        for row in 0..<grid.count {
            if grid[row][column] == 1 {
                colums.append(column)
            }
        }
    }
    return colums
}

func collectRow(_ grid:[[Int]]) -> [Int] {
    var rows = [Int]()
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            if grid[row][column] == 1 {
                rows.append(row)
            }
        }
    }
    return rows
}


func minDistTwoPointer(_ points: [Int]) -> Int {
    var dist = 0
    var i = 0
    var j = points.count - 1
    while i < j {
        
        dist += points[j] - points[i]
        
        i += 1
        j -= 1
    }
    
    return dist
}

minTotalDistance([[1,2,3,4,5]])
