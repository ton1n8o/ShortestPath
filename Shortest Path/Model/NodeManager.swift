//
//  NodeManager.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 20/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

struct NodeManager {
    
    func createNode(_ name: String, withNeighbour: String, atDistance: Int = 0) -> Node {
        var nodeA = Node(name: name)
        let neighbor = (Node(name: withNeighbour), atDistance)
        nodeA.neighbours.append(neighbor)
        return nodeA
    }
    
    func addNode(_ node: Node, toNode: Node, atDistance: Int = 0) -> Node {
        var toNode = toNode
        let neighbour = (node, atDistance)
        toNode.neighbours.append(neighbour)
        return toNode
    }
    
}
