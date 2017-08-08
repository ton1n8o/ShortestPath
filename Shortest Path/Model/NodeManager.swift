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
    
    func shortestPathFrom(_ nodeA: String, to nodeB: String) -> Int {
        
        guard let node1 = nodeChain.findNodeByName(nodeA) else { return 0 }
        guard let node2 = nodeChain.findNodeByName(nodeB) else { return 0 }
        
        let data = costlessNode(node1, node2: node2, distance: 0)
        
        return data.distance
    }
    
    func costlessNode(_ node1: Node, node2: Node, distance: Int) -> (node: Node, distance: Int) {
        
        var totalDistance = distance
        var distance = 0
        var costNode: Node?
        
        for nb in node1.neighbours {
            
            NSLog("Node:\(nb.node.name) Cost:\(nb.distance)")
            let cost = nb.distance + (node1.distanceCost ?? 0)
            
            nb.node.distanceCost = cost
            
            if distance == 0 || cost < distance {
                distance = cost
                costNode = nb.node
            }

        }
        
        totalDistance = distance
        
        if let n = costNode, n.neighbours.count > 0 {
            return costlessNode(n, node2: node2, distance: totalDistance)
        }
        
        return (costNode ?? node1, totalDistance)
        
    }
    
}
