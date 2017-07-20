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
    
}
