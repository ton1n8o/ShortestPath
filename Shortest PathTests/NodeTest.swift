//
//  NodeTest.swift
//  Shortest PathTests
//
//  Created by Antonio da Silva on 19/07/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import XCTest
@testable import Shortest_Path

class NodeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Init_WhenGiveName_SetsName() {
        let node = Node(name: "Foo")
        
        XCTAssertEqual(node.name, "Foo")
    }
    
    func test_Init_WhenGivenDistance_SetsDistance() {
        let node = Node(name: "Foo", distanceCost: 1)
        
        XCTAssertEqual(node.distanceCost, 1)
    }
    
    func test_Init_WhenGivingNeighbors_SetsNeighbors() {
        let neighbours: [(node: Node, distance: Int)] = []
        let node = Node(name: "Foo", neighbours: neighbours)
        
        XCTAssertNotNil(node.neighbours)
    }
    
    func test_Init_WhenGivingVisited_SetsVisited() {
        let node = Node(name: "Foo", visited: true)
        
        XCTAssertTrue(node.visited)
    }
    
    func test_Nodes_WhenNameDiffer_AreNotEqual() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        
        XCTAssertNotEqual(nodeA, nodeB)
    }
    
    func test_Nodes_WhenNameEqual_AreEqual() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_A")
        
        XCTAssertEqual(nodeA, nodeB)
    }
    
    func test_DescribeNeighbours_ReturnsNodeNeighboursDescription() {
        let neighbour_B = (Node(name: "node_B"), distance: 10)
        let neighbour_C = (Node(name: "node_C"), distance: 15)
        let nodeA = Node(name: "node_A", neighbours: [neighbour_B, neighbour_C])
        
        let neighboursDescription = nodeA.describeNeighbours()
        
        XCTAssertEqual(neighboursDescription, "parent: node_A:\n  name: node_B, distance: 10\n  name: node_C, distance: 15")
    }
    
    func test_DescribeNeighbours_WhenNoNeighbours_ReturnsParentsName() {
        let nodeA = Node(name: "node_A")
        
        let neighboursDescription = nodeA.describeNeighbours()
        
        XCTAssertEqual(neighboursDescription, "parent: node_A:\n  no neighbours.")
    }
    
    func test_NodeCount_Returns_TotalNodes() {
        let nodeA = Node(name: "node_A")
        XCTAssertEqual(nodeA.nodeCount(), 1)
    }
    
    func test_FindNodeByName_ReturnsNode() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        let nodeC = Node(name: "node_C")
        
        nodeB.neighbours.append((nodeC, 0))
        nodeA.neighbours.append((nodeB, 0))
        
        XCTAssertNotNil(nodeA.findNodeByName("node_C"))
    }
    
    func test_FindNodeByName_When_Not_Found_Returns_Nil() {
        let nodeA = Node(name: "node_A")
        
        XCTAssertNil(nodeA.findNodeByName(""))
    }
    
    func test_FindNodeByNameWithNeighbour_When_Not_Found_Returns_Nil() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        nodeA.neighbours.append((nodeB, 0))
        
        XCTAssertNil(nodeA.findNodeByName(" "))
    }
    
    func test_NodeCount_WhenNode_Has_OneChield_Returns_TotalNodesTwo() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")

        nodeA.neighbours.append((nodeB, 0))
        
        XCTAssertEqual(nodeA.nodeCount(), 2)
    }
    
    func test_AddNeighbour_ShouldAdd_NewNeighbour() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        
        nodeA.addNeighbour(nodeB)
        
        XCTAssertEqual(nodeA.nodeCount(), 2)
    }
    
    func test_AddNeighbourAtDistance_ShouldAdd_NeighbourAtDistance() {
        let nodeA = Node(name: "node_A")
        let nodeB = Node(name: "node_B")
        
        nodeA.addNeighbour(nodeB, atDistance: 10)
        
        XCTAssertEqual(nodeA.nodeCount(), 2)
        XCTAssertEqual(nodeA.neighbours.first?.distance, 10)
    }
    
    func test_NextNotVisited_Returns_NextNotVisited() {
        let nodeA = Node(name: "node_A")
        nodeA.visited = true
        let nodeB = Node(name: "node_B")
        nodeB.visited = true
        let nodeC = Node(name: "node_C")
        nodeB.addNeighbour(nodeC)
        nodeA.addNeighbour(nodeB)
        nodeA.addNeighbour(nodeC)
        
        XCTAssertEqual(nodeA.nextNotVisited(), nodeC)
    }
    
    func test_NextNotVisited_WhenAllNodesVisited_Returns_Nil() {
        let nodeA = Node(name: "node_A")
        nodeA.visited = true
        let nodeB = Node(name: "node_B")
        nodeB.visited = true
        let nodeC = Node(name: "node_C")
        nodeC.visited = true
        nodeB.addNeighbour(nodeC)
        nodeA.addNeighbour(nodeB)
        nodeA.addNeighbour(nodeC)
        
        XCTAssertNil(nodeA.nextNotVisited())
    }
}
