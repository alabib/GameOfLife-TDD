//
//  GameBoardCellTests.swift
//  GameOfLifeTests
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameBoardCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenState_SetsState() {
        
        let cell = GameBoardCell(cellState: .alive)
        XCTAssertEqual(cell.cellState, .alive, "should set State")
    }
    
    func test_Init_WhenGivenDeadState_SetsDeadState() {
        
        let cell = GameBoardCell(cellState: .dead)
        XCTAssertEqual(cell.cellState, .dead, "should set State")
    }
    
    func test_Init_WhenGivenPermanentDeadState_SetsPermanentDeadState() {
    
    let cell = GameBoardCell(cellState: .permanentlyDead)
    XCTAssertEqual(cell.cellState, .permanentlyDead, "should set State")
    }
    
    func test_Init_WhenGivenXPosition_SetsXPosition() {
        
        let cell = GameBoardCell(cellState: .dead, x: 10)
        XCTAssertEqual(cell.x, 10, "should set X")
    }
    
    func test_Init_WhenGivenYPosition_SetsYPosition() {
        
        let cell = GameBoardCell(cellState: .dead, y: 10)
        XCTAssertEqual(cell.y, 10, "should set Y")
    }
    
    func test_Init_WhenNotGivenXPosition_SetYXPositionAtZero() {
        
        let cell = GameBoardCell(cellState: .dead)
        XCTAssertEqual(cell.x, 0, "should set X to Zero")
    }
    
    func test_Init_WhenNotGivenYPosition_SetYPositionAtZero() {
        
        let cell = GameBoardCell(cellState: .dead)
        XCTAssertEqual(cell.y, 0, "should set Y to Zero")
    }
    
    func test_EqualItems_AreEqual() {
        let first = GameBoardCell(cellState: .alive)
        let second = GameBoardCell(cellState: .alive)
        XCTAssertEqual(first, second)
    }
    
    func test_NotEqualItems_AreNotEqual() {
        let first = GameBoardCell(cellState: .dead)
        let second = GameBoardCell(cellState: .alive)
        XCTAssertNotEqual(first, second)
    }
    
}
