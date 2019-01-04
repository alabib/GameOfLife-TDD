//
//  CoordinateTests.swift
//  GameOfLifeTests
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import XCTest
@testable import GameOfLife

class CoordinateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_Init_WhenGivenXPosition_SetsXPosition() {
        
        let coordinate = Coordinate(x: 5, y: 0)
        XCTAssertEqual(coordinate.x, 5, "should set X")
    }
    
    func test_Init_WhenGivenYPosition_SetsYPosition() {
        
        let coordinate = Coordinate(x: 0, y: 5)
        XCTAssertEqual(coordinate.y, 5, "should set Y")
    }
    
    func test_EqualCoordinates_AreEqual() {
        let first = Coordinate(x: 0, y: 0)
        let second = Coordinate(x: 0, y: 0)
        XCTAssertEqual(first, second)
    }
    
    func test_NotEqualCoordinates_AreNotEqual() {
        let first = Coordinate(x: 0, y: 1)
        let second = Coordinate(x: 1, y: 0)
        XCTAssertNotEqual(first, second)
    }
    
}
