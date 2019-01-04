//
//  GameBoardCreatorTests.swift
//  GameOfLifeTests
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameOfLifeBoardTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NewBoard_WhenGivenDimensions_ITotlallySeeTheRightThing(){
        
        let board = GameOfLifeBoard(with: 10, and: 10)
        let renderer = GameBoardRenderer()
        let output = renderer.render(gameBoard: board)
        
        for line in output {
            print(line)
        }
        
    }

    func test_NewBoard_WhenGivenDimensions_IsNotNil() {
        let board = GameOfLifeBoard(with: 30, and: 30)
        
        XCTAssertNotNil(board)
        XCTAssertEqual(board.width, 30)
        XCTAssertEqual(board.height, 30)
    }
    
    func test_NewBoard_WhenGivenDimensions_RowsAreNotNull() {
        let board = GameOfLifeBoard(with: 30, and: 30)
        
        XCTAssertNotNil(board.rows)
        XCTAssertEqual(board.rows.count, 30)
        XCTAssertEqual(board.rows[0].count, 30)
    }
    
    func test_NewBoard_WhenGivenDimensionsAndStrategy_GeneratsCellsUsingSuppliedStrategy() {
        let mockCellGenerator = MockCellGeneratorForBoard()
        let expectedCell = GameBoardCell(cellState: .dead)
        let board = GameOfLifeBoard(with: 1, and: 1, cellGenerator: mockCellGenerator)
        
        XCTAssertEqual(board.rows[0][0],expectedCell)
        XCTAssertEqual(board.rows[0][0].x,0)
        XCTAssertEqual(board.rows[0][0].y,0)
    }
    
    func test_Step_WhenGivenOneLivingCell_CellDies() {
        let cells = [GameBoardCell(cellState: .alive)]
        let board = GameOfLifeBoard(with: 1, and: 1, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[0][0].cellState == .dead)
    }
    
    func test_Step_WhenGivenTwoLivingNeighbours_CellLives() {
        let cells = [
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive)
        ]
        let board = GameOfLifeBoard(with: 3, and: 1, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[0][1].cellState == .alive)
    }
    
    func test_Step_WhenGivenMoreThanThreeLivingNeighbours_CellDies() {
        let cells = [
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive)
        ]
        let board = GameOfLifeBoard(with: 3, and: 3, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[1][1].cellState == .dead)
    }
    
    func test_Step_WhenGivenFourLivingNeighbours_CellDies() {
        let cells = [
            GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .dead),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .dead)
        ]
        let board = GameOfLifeBoard(with: 3, and: 3, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[1][1].cellState == .dead)
    }
    
    func test_Step_WhenGivenThreeLivingNeighboursForDeadCell_CellLives() {
        let cells = [
            GameBoardCell(cellState: .dead), GameBoardCell(cellState: .alive), GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive)
        ]
        let board = GameOfLifeBoard(with: 3, and: 3, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[0][0].cellState == .alive)
    }
    
    func test_Step_WhenGivenFourLivingNeighboursForDeadCell_CellPermanentlyDies() {
        let cells = [
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive)
        ]
        let board = GameOfLifeBoard(with: 3, and: 3, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[1][0].cellState == .permanentlyDead)
    }
    
    func test_Step_WhenGivenMoreThanFourLivingNeighboursForDeadCell_CellPermanentlyDies() {
        let cells = [
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .dead),    GameBoardCell(cellState: .alive),
            
            GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive),   GameBoardCell(cellState: .alive)
        ]
        let board = GameOfLifeBoard(with: 3, and: 3, cellGenerator:MockStaticListStrategy(withCells: cells))
        
        board.step()
        
        XCTAssertTrue(board.rows[1][1].cellState == .permanentlyDead)
    }


}

extension GameOfLifeBoardTests {
    
    class MockCellGeneratorForBoard : CellGenerationStrategy {
        
        func generate(numberOfCells numberOfCellsToGenerate: Int) -> [GameBoardCell] {
            
            let cellsList = Array.init(repeating: GameBoardCell(cellState: .dead), count: numberOfCellsToGenerate)
            
            return cellsList
        }
        
        
    }
}

extension GameOfLifeBoardTests {
    
    class MockStaticListStrategy : CellGenerationStrategy {
        
        private private(set) var cells: [GameBoardCell]
        
        init(withCells cells:[GameBoardCell]) {
            self.cells = cells
        }
        func generate(numberOfCells numberOfCellsToGenerate: Int) -> [GameBoardCell] {
            
            return self.cells
        }
        
        
    }
}

