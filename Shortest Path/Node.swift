//
//  Node.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 19/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

struct Node {
    
    let name: String
    let distanceCost: Int?
    let distanceToNeighbor: Int
    let neighbors: [Node]
    let visited: Bool
    
    init(name: String,
         visited: Bool = false,
         distanceCost: Int? = nil,
         distanceToNeighbor: Int = 0,
         neighbors: [Node] = []
        ) {
        self.name = name
        self.visited = visited
        self.distanceCost = distanceCost
        self.distanceToNeighbor = distanceToNeighbor
        self.neighbors = neighbors
    }
}
