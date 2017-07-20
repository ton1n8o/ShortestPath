//
//  Node.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 19/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

struct Node: Equatable {
    
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
    
    func describeNeighbours() -> String {
        var desc = ""
        for neighbour in neighbours {
            let name = neighbour.node.name
            let distance = neighbour.distance
            desc += "name: \(name), distance: \(distance)\n"
        }
        if !desc.isEmpty {
            desc = String(desc.characters.dropLast(1))
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
