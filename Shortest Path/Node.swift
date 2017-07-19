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
    let distance: Int
    let neighbors: [Node]
    
    init(name: String, distance: Int = 0, neighbors: [Node] = []) {
        self.name = name
        self.distance = distance
        self.neighbors = neighbors
    }
}
