//
//  NodeManager.swift
//  Shortest Path
//
//  Created by Antonio da Silva on 20/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation

struct NodeManager {
    
    var nodeChain: Node!
    
    init(baseNodeName: String) {
        self.nodeChain = Node(name: baseNodeName)
    }
    
    func createNode(_ name: String, withNeighbour: String, atDistance: Int = 0) -> Node {
        let nodeA = Node(name: name)
        let neighbor = (Node(name: withNeighbour), atDistance)
        nodeA.neighbours.append(neighbor)
        return nodeA
    }
    
    mutating func addNode(_ node: Node, toNodeNamed: String, atDistance: Int = 0) {
        if nodeChain.findNodeByName(node.name) == nil {
            nodeChain.findNodeByName(toNodeNamed)?.neighbours.append((node, atDistance))
        }
    }
    
    func nodeCount() -> Int {
        return nodeChain.nodeCount()
    }
    
}
