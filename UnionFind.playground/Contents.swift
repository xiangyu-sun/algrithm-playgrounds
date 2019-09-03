import UIKit

func numIslandsDFS(_ grid: [[Character]]) -> Int {
    guard grid.count != 0 else { return 0 }
    var grid = grid

    var numOfIslands = 0
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            if grid[row][column] == "1" {
                numOfIslands += 1
                dfs(grid: &grid, row: row, column: column)
            }
        }
    }
    
    return numOfIslands
}


func dfs(grid: inout [[Character]], row: Int, column: Int) {
    guard row >= 0, column >= 0, row < grid.count, column < grid[0].count,
        grid[row][column] == "1" else {return}
    
    grid[row][column] = "0"
    
    dfs(grid: &grid, row: row, column: column + 1)
    dfs(grid: &grid, row: row, column: column - 1)
    
    dfs(grid: &grid, row: row + 1, column: column)
    dfs(grid: &grid, row: row - 1, column: column)
}

struct Point {
    let row: Int
    let column: Int
}

func numIslandsBFS(_ grid: [[Character]]) -> Int {
    guard grid.count != 0 else { return 0 }
    var grid = grid
    
    var numOfIslands = 0
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            guard grid[row][column] == "1" else { continue }
            
            numOfIslands += 1
            grid[row][column] = "0"
            
            var q = [Point]()
            let startPoint = Point(row: row, column: column)
            q.append(startPoint)
            
            while !q.isEmpty {
                let current = q.removeFirst()
                
                
                guard current.row >= 0, current.column >= 0, current.row  < grid.count, current.column  < grid[0].count,
                    grid[current.row][ current.column] == "1" else {continue}
                
                grid[current.row][ current.column] = "0"
                
                q.append(contentsOf:[ Point(row: current.row, column: current.column + 1),
                     Point(row: current.row, column: current.column - 1),
                     Point(row: current.row + 1, column: current.column),
                     Point(row: current.row - 1, column: current.column)])
                
            }
            
            
        }
    }
    
    return numOfIslands
}


func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count != 0 else { return 0 }
    var grid = grid

    let union = UnionFind(grid: grid)
    let nr = grid.count
    let nc = grid[0].count
    
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            guard grid[row][column] == "1" else { continue }
            grid[row][column] = "0"
            
            if row - 1 >= 0 , grid[row - 1][column] == "1" {
                union.union(x: row * nr + column, y: (row - 1) * nr + column)
            }
            
            if row + 1 < nr , grid[row + 1][column] == "1" {
                union.union(x: row * nr + column, y: (row + 1) * nr + column)
            }
            
            if column + 1 < nc , grid[row][column + 1] == "1" {
                union.union(x: row * nr + column, y: row * nr + column + 1)
            }
            
            if column - 1 >= 0 , grid[row][column - 1] == "1" {
                union.union(x: row * nr + column, y: row * nr + column - 1)
            }
        }
    }
    
    return union.count
}


class UnionFind {
    private(set) var count: Int
    var parent: [Int]
    var rank: [Int]
    
    
    init(grid: [[Character]]) {
        count = 0
        let size = grid.count * grid[0].count
        parent = [Int](repeating: -1, count: size)
        rank = [Int](repeating: 0, count: size)
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                
                let index = row * grid[0].count + column
                if grid[row][column] == "1" {
                    
                    parent[index] = index
                    count += 1
                }
            }
        }
    }
    
    func find(index: Int) -> Int {
        if parent[index] != index {
            parent[index] = find(index: parent[index])
        }
        return parent[index]
    }
    
    
    func union(x: Int, y :Int) {

        let rootx = find(index: x)
        let rooty = find(index: y)
        if rootx != rooty {
            if rank[rootx] > rank[rooty] {
                parent[rooty] = rootx
            } else if rank[rootx] < rank[rooty] {
                parent[rootx] = rooty
            } else {
                parent[rooty] = rootx
                rank[rootx] += 1
            }
            count -= 1
        }
    }
}

numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
