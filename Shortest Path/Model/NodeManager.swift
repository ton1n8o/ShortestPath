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
    
    /// TODO: Not so clear by now
    func createNodeChainOf(_ elements: Int) -> Node {
        var tmpNode: Node!
        var count = 1
        repeat {
            tmpNode = Node(name: "node_\(count)")
            nodeChain.addNeighbour(tmpNode)
            count += 1
        } while count < elements
        
        return nodeChain
    }
    
    func createNode(_ name: String, withNeighbour: String, atDistance: Int = 0) -> Node {
        let nodeA = Node(name: name)
        nodeA.addNeighbour(Node(name: withNeighbour), atDistance: atDistance)
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
