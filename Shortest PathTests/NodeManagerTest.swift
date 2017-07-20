//
//  NodeManagerTest.swift
//  Shortest PathTests
//
//  Created by Antonio da Silva on 20/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import XCTest
@testable import Shortest_Path

class NodeManagerTest: XCTestCase {
    
    var sut: NodeManager!
    
    override func setUp() {
        super.setUp()
        sut = NodeManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_CreateNodeWithNeighbour_Returns_NodeWithNeighbour() {
        let node = sut.createNode("node_A", withNeighbour: "node_B")
        let neighbour = node.neighbours.first?.node
        
        XCTAssertEqual(neighbour?.name, "node_B")
    }
    
    func test_CreateNodeWithNeighbourAndDistance_Returns_NodeWithNeighbourAndDistance() {
        let node = sut.createNode("node_A", withNeighbour: "node_B", atDistance: 10)
        let neighbour = node.neighbours.first
        
        XCTAssertEqual(neighbour?.distance, 10)
    }
    
    func test_AddNodeToNode_Returns_NodeWithNewAddedNode() {
        let nodeA = (Node(name: "node_A"))
        let nodeB = (Node(name: "node_B"))
        
        let nodeWithNeighbour = sut.addNode(nodeB, toNode: nodeA)
        let nodeNeighbour = nodeWithNeighbour.neighbours.first?.node
        
        XCTAssertEqual(nodeNeighbour, nodeB)
    }
    
}
