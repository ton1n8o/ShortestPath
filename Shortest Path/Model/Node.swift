//
//  Node.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 19/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

class Node: Equatable {
    
    let name: String
    var distanceCost: Int?
    var neighbours: [(node: Node, distance: Int)]
    var visited: Bool
    
    init(name: String,
         visited: Bool = false,
         distanceCost: Int? = nil,
         neighbours: [(Node, Int)] = []
        ) {
        self.name = name
        self.visited = visited
        self.distanceCost = distanceCost
        self.neighbours = neighbours
    }
    
    func addNeighbour(_ node: Node, atDistance: Int = 0) {
        self.neighbours.append((node: node, distance: atDistance))
    }
    
    func findNodeByName(_ name: String) -> Node? {
        if self.name == name {
            return self
        }
        var nodeFound: Node? = nil
        for n in neighbours {
            nodeFound = n.node.findNodeByName(name)
            if nodeFound != nil {
                break
            }
        }
        return nodeFound
    }
    
    func nodeCount() -> Int {
        var count = 1
        for n in neighbours {
            count += n.node.nodeCount()
        }
        return count
    }
    
    func nextNotVisited() -> Node? {
        if !self.visited {
            return self
        }
        for neighbour in neighbours {
            return neighbour.node.nextNotVisited()
        }
        return nil
    }
    
    func describeNeighbours() -> String {
        var desc = "parent: \(name):"
        if neighbours.isEmpty {
            return "parent: \(name):\n  no neighbours."
        }
        for neighbour in neighbours {
            let name = neighbour.node.name
            let distance = neighbour.distance
            desc += "\n  name: \(name), distance: \(distance)"
        }
        return desc
    }
    
    // MARK: - Equatable
    
    static func ==(nodeA: Node, nodeB: Node) -> Bool {
        if nodeA.name != nodeB.name {
            return false
        }
        return true
    }

}
