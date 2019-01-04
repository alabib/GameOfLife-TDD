//
//  CellGeneratorTests.swift
//  GameOfLifeTests
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import XCTest
@testable import GameOfLife

class CellGeneratorTests: XCTestCase {
    
    var generator : CellGenerator!
    
    override func setUp() {
        super.setUp()
        
        generator = CellGenerator()
    }
    
    override func tearDown() {
        
        generator = nil
        
        super.tearDown()
    }
    
    func test_GenerateCells_AskForTwoCells_OneAliveOneDead() {
        
        let cells = generator.generate(numberOfCells: 2)
        
        XCTAssertEqual(cells.filter { $0.cellState == .alive}.count, 1)
        XCTAssertEqual(cells.filter { $0.cellState == .dead}.count, 1)
    }
    
    func test_GenerateCells_AskForThreeCells_OneDeadTwoAlive() {
        
        let cells = generator.generate(numberOfCells: 3)
        
        XCTAssertEqual(cells.filter { $0.cellState == .alive}.count, 1)
        XCTAssertEqual(cells.filter { $0.cellState == .dead}.count, 2)
    }
    
}
