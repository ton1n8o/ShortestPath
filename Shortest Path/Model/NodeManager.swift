//
//  NodeManager.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 20/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

struct NodeManager {
    
    func createNode(_ name: String, withNeighbour: String) -> Node {
        var nodeA = Node(name: name)
        let neighbour = createNeighbor(with: withNeighbour, atDistance: 0)
        nodeA.neighbours.append(neighbour)
        return nodeA
    }
    
    func createNode(_ name: String, withNeighbour: String, atDistance: Int) -> Node {
        var nodeA = Node(name: name)
        let neighbor = createNeighbor(with: withNeighbour, atDistance: atDistance)
        nodeA.neighbours.append(neighbor)
        return nodeA
    }
    
    func createNeighbor(with name: String, atDistance: Int) -> (Node, Int) {
        return (Node(name: name), atDistance)
    }
    
    func addNode(_ node: Node, toNode: Node) -> Node {
        var toNode = toNode
        let neighbour = (node, 0)
        toNode.neighbours.append(neighbour)
        return toNode
    }
    
}
