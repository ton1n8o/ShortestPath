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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGiveName_SetsName() {
        let node = Node(name: "Foo")
        
        XCTAssertEqual(node.name, "Foo", "should set node name.")
    }
    
    func test_Init_WhenGivenDistance_SetsDistance() {
        let node = Node(name: "Foo", distance: 1)
        
        XCTAssertEqual(node.distance, 1, "should set distance.")
    }
    
    func test_Init_WhenGivingNeighbors_SetsNeighbors() {
        let neighbors: [Node] = []
        let node = Node(name: "Foo", neighbors: neighbors)
        
        XCTAssertNotNil(node.neighbors, "should set neighbors.")
    }
    
}
