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
        
        guard let nodeStart = nodeChain.findNodeByName(nodeA) else { return 0 }
        guard let nodeDesti = nodeChain.findNodeByName(nodeB) else { return 0 }
        
        nodeStart.distanceCost = 0
        return costlessNode(nodeStart, nodeDest: nodeDesti)
        
    }
    
    func costlessNode(_ nodeStart: Node, nodeDest: Node) -> Int {
        
        print("Current Node: \(nodeStart.name)")
        
        if nodeStart == nodeDest {
            return nodeStart.distanceCost!
        }
        
        for neighbourNode in nodeStart.neighbours {
            print("   Current Node: \(neighbourNode.node.name)")
            let distance = neighbourNode.distance + (nodeStart.distanceCost ?? 0)
            if neighbourNode.node.distanceCost == nil || neighbourNode.node.distanceCost! > distance {
                neighbourNode.node.distanceCost = distance
            }
        }
        
        var nextNode: Node!
        for neighbourNode in nodeStart.neighbours {
            if nextNode == nil {
                nextNode = neighbourNode.node
            } else if nextNode.distanceCost! > neighbourNode.node.distanceCost! {
                nextNode = neighbourNode.node
            }
            if neighbourNode.node == nodeDest {
                nextNode = neighbourNode.node
            }
        }
        
        return costlessNode(nextNode, nodeDest: nodeDest)
    }
    
}
