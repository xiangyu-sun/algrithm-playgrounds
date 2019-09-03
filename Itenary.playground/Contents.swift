import UIKit

var map = [String: [String]]()
var path = [String]()

func findItinerary(_ tickets: [[String]]) -> [String] {
    tickets.forEach { (itenar) in
        if map[itenar[0]] == nil {
            map[itenar[0]] = []
        }
        map[itenar[0]]!.append(itenar[1])
    }
    
    map.forEach { (key, queue) in
        map[key] = queue.sorted()
    }
    findNext("JFK")
    return path
}


func findNext(_ airport: String) {
    while var airportQueue = map[airport], !airportQueue.isEmpty {
        findNext( map[airport]!.removeFirst())
    }
    path.insert(airport, at: 0)
}

findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])

