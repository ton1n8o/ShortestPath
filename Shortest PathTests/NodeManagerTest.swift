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
        sut = NodeManager(baseNodeName: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_Init_NodeManager_Returns_NodeManger_With_NewChain() {
        let nodeManager = NodeManager(baseNodeName: "")
        
        XCTAssertNotNil(nodeManager.nodeChain)
    }
    
    func test_Init_NodeManager_WithBaseNodeName_Returns_Chain_With_BaseNodeNamed() {
        let nodeManager = NodeManager(baseNodeName: "node_A")
        
        XCTAssertEqual(nodeManager.nodeChain.name, "node_A")
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
    
    func test_AddNode_Should_AddNodeToChain() {
        let nodeB = Node(name: "node_B")
        sut.addNode(nodeB, toNodeNamed: "")
        
        XCTAssertEqual(sut.nodeChain.neighbours.first?.node, nodeB)
    }
    
    func test_AddNodeToChainAtDistance_UpdatesChain_WithNewAddedNodeAtDistance() {
        let nodeB = Node(name: "node_B")
        sut.addNode(nodeB, toNodeNamed: "", atDistance: 5)
        
        let newAddedNode = sut.nodeChain.neighbours.first?.node
        let newAddedNodeDistance = sut.nodeChain.neighbours.first?.distance
        
        XCTAssertEqual(nodeB, newAddedNode)
        XCTAssertEqual(newAddedNodeDistance, 5)
    }
    
    func test_AddNodeToNodeNamed_Should_UpdateChain_WithNewAddedNode() {
        sut = NodeManager(baseNodeName: "node_A")
        let nodeB = Node(name: "node_B")
        sut.addNode(nodeB, toNodeNamed: "node_A")
        let nodeC = Node(name: "node_C")
        
        sut.addNode(nodeC, toNodeNamed: "node_B")
        
        XCTAssertEqual(nodeB.neighbours.first?.node, nodeC)
    }
    
    func test_AddNodeToNodeNamedAtDistance_UpdatesChain_WithNewAddedNodeAtDistance() {
        sut = NodeManager(baseNodeName: "node_A")
        let nodeB = Node(name: "node_B")
        sut.addNode(nodeB, toNodeNamed: "node_A")
        let nodeC = Node(name: "node_C")
        
        sut.addNode(nodeC, toNodeNamed: "node_B", atDistance: 5)
        
        XCTAssertEqual(nodeB.neighbours.first?.node, nodeC)
        XCTAssertEqual(nodeB.neighbours.first?.distance, 5)
    }
    
    func test_NodeCount_AddingNodeWithChild_Returns_TotalNodes() {
        let nodeA = Node(name: "node_A")
        let nodeB = sut.createNode("node_B", withNeighbour: "node_C", atDistance: 10)
        nodeA.neighbours.append((node: nodeB, 4))
        
        sut.addNode(nodeA, toNodeNamed: "")
        
        XCTAssertEqual(sut.nodeCount(), 4)
    }
    
    func test_AddNode_Cant_Add_DuplicatedNodes() {
        let nodeA = Node(name: "")
        
        sut.addNode(nodeA, toNodeNamed: "")
        
        XCTAssertEqual(sut.nodeCount(), 1)
    }
    
    /// TODO: Not so clear by now
    func test_CreateNodeChain_Returns_NodeChain() {
        let sut = NodeManager(baseNodeName: "node_A")
        
        let nodeChain = sut.createNodeChainOf(5)
        
        XCTAssertEqual(nodeChain.nodeCount(), 5)
    }
    
    func test_FindShortestPath_When_OneNode_Returns_Zero() {
        let distance = sut.shortestPathFrom("", to: "")
        XCTAssertEqual(distance, 0)
    }
    
    func test_FindShortestPath_When_TwoNodes_Returns_Distance() {
        var sut = NodeManager(baseNodeName: "node_A")
        sut.addNode(Node(name: "node_B"), toNodeNamed: "node_A", atDistance: 5)
        let distance = sut.shortestPathFrom("node_A", to: "node_B")
        XCTAssertEqual(distance, 5)
    }
    
    func test_FindShortestPath_When_FirstNodeDoesNotExist_Returns_Zero() {
        var sut = NodeManager(baseNodeName: "node_A")
        sut.addNode(Node(name: "node_B"), toNodeNamed: "node_A", atDistance: 5)
        let distance = sut.shortestPathFrom("X", to: "node_B")
        XCTAssertEqual(distance, 0)
    }
    
    func test_FindShortestPath_When_SecondNodeDoesNotExist_Returns_Zero() {
        var sut = NodeManager(baseNodeName: "node_A")
        sut.addNode(Node(name: "node_B"), toNodeNamed: "node_A", atDistance: 5)
        let distance = sut.shortestPathFrom("node_A", to: "X")
        XCTAssertEqual(distance, 0)
    }
    
    func test_FindShortestPath_When_ThreeNodes_Returns_Distance() {
        var sut = NodeManager(baseNodeName: "node_A")
        sut.addNode(Node(name: "node_B"), toNodeNamed: "node_A", atDistance: 1)
        let nodeB = sut.nodeChain.findNodeByName("node_B")!
        nodeB.addNeighbour(Node(name: "node_C"), atDistance: 3)
        let nodeA = sut.nodeChain.findNodeByName("node_A")!
        let nodeC = sut.nodeChain.findNodeByName("node_C")!
        nodeA.addNeighbour(nodeC, atDistance: 2)

        let distance = sut.shortestPathFrom("node_A", to: "node_C")

        XCTAssertEqual(distance, 2)
    }
    
    func test_FindShortestPath_Returns_NodePath() {
        
        var sut = NodeManager(baseNodeName: "node_A")
        
        sut.addNode(Node(name:"node_B"), toNodeNamed: "node_A", atDistance: 6)
        sut.addNode(Node(name:"node_D"), toNodeNamed: "node_A", atDistance: 1)
        
        let nodeD = sut.nodeChain.findNodeByName("node_D")!
        let nodeB = sut.nodeChain.findNodeByName("node_B")!
        nodeD.addNeighbour(Node(name: "node_E"), atDistance: 1)
        nodeD.addNeighbour(nodeB, atDistance: 2)
        
        let nodeE = sut.nodeChain.findNodeByName("node_E")!
        nodeB.addNeighbour(nodeE, atDistance: 2)
        nodeB.addNeighbour(Node(name: "node_C"), atDistance: 5)
        
        let nodeC = sut.nodeChain.findNodeByName("node_C")!
        nodeE.addNeighbour(nodeC, atDistance: 5)
        
        let distance = sut.shortestPathFrom("node_A", to: "node_C")
        
        XCTAssertEqual(distance, 7, "the distance from NODE_A to NODE_C is 7")
        
        print("\(sut.nodeChain.describeNeighbours())")
    }
    
}
