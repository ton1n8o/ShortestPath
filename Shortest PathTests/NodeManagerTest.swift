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
    
    func test_CreateNodeWithNeighbourAtDistance_Returns_NodeWithNeighbourAtDistance() {
        let node = sut.createNode("node_A", withNeighbour: "node_B", atDistance: 10)
        let neighbour = node.neighbours.first
        
        XCTAssertEqual(neighbour?.distance, 10)
    }
    
    func test_AddNodeToNode_Returns_NodeWithNewAddedNode() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        
        let nodeWithNeighbour = sut.addNode(nodeB, toNode: nodeA)
        let newNodeNeighbour = nodeWithNeighbour.neighbours.first?.node
        
        XCTAssertEqual(nodeA, nodeWithNeighbour)
        XCTAssertEqual(newNodeNeighbour, nodeB)
    }
    
    func test_AddNodeToNodeAtDistance_Returns_NodeWithNewAddedNodeAtDistance() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        
        let nodeWithNeighbour = sut.addNode(nodeB, toNode: nodeA, atDistance: 5)
        let newNodeNeighbourDistance = nodeWithNeighbour.neighbours.first?.distance
        
        XCTAssertEqual(nodeA, nodeWithNeighbour)
        XCTAssertEqual(newNodeNeighbourDistance, 5)
    }
    
    func test_SaveNodeChain_Should_SaveNodeInNodeManager() {
        let nodeA = Node(name: "node_A")
        
        sut.saveNodeChain(nodeA)
        
        XCTAssertEqual(sut.nodeChain, nodeA)
    }
    
    func test_NodeCount_Returns_TotalNodeCount() {
        let nodeA = Node(name: "node_A")
        sut.saveNodeChain(nodeA)
        XCTAssertEqual(sut.nodeCount(), 1)
    }
    
    func test_NodeCount_AddingTwoNodes_Returns_TotalNodeCountTwo() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")

        sut.saveNodeChain(nodeA)
        let newNodeChain = sut.addNode(nodeB, toNode: sut.nodeChain, atDistance: 10)
        sut.saveNodeChain(newNodeChain)
        XCTAssertEqual(sut.nodeCount(), 2)
    }

    func test_NodeCount_AddingNodeWithChild_ReturnsTotalNodeCountThree() {
        let nodeA = Node(name: "node_A")
        let nodeB = sut.createNode("node_B", withNeighbour: "node_C", atDistance: 10)

        let nodeChain = sut.addNode(nodeB, toNode: nodeA, atDistance: 5)

        sut.saveNodeChain(nodeChain)

        XCTAssertEqual(sut.nodeCount(), 3)
    }
    
    func test_NodeCount_AddingNodeWithTwoLevelChild_ReturnsTotalNodeCount() {
        var nodeA = Node(name: "node_A")
        var nodeB = Node(name: "node_B")
        let nodeC = sut.createNode("node_C", withNeighbour: "node_D", atDistance: 23)
        
        nodeB = sut.addNode(nodeC, toNode: nodeB, atDistance: 5)
        nodeA = sut.addNode(nodeB, toNode: nodeA, atDistance: 3)
        
        sut.saveNodeChain(nodeA)
        
        XCTAssertEqual(sut.nodeCount(), 4)
    }
    
}
