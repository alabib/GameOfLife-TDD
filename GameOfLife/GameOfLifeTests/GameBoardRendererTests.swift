//
//  GameBoardRendererTests.swift
//  GameOfLifeTests
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameBoardRendererTests: XCTestCase {
    
    private var sut : GameBoardRenderer!
    override func setUp() {
        super.setUp()
        
        sut = GameBoardRenderer()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_Init_WhenGivenWidth_SetsWidth() {
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 5, and: 0)
        XCTAssertEqual(gameOfLifeBoard.width, 5,
                       "should set Width")
    }
    
    func test_Init_WhenGivenHeight_SetsHeight() {
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 0, and: 5)
        XCTAssertEqual(gameOfLifeBoard.height, 5,
                       "should set Height")
    }
    
    func test_Render_WhenGivenValidGameBoardWithZeroDimensions_ReturnsEmptyArray(){
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 0, and: 0)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        XCTAssertTrue(output.count == 0)
    }
    
    func test_Render_WhenGivenValidNotNilGameBoard_ReturnsCorrectNumberOfLines(){
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 5, and: 5)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        XCTAssertEqual(output.count, 5)
    }
    
    func test_Render_WhenGivenValidNotNilGameBoard_ReturnsCorrectNumberOfLinesOfCorrectWidths(){
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 8, and: 5)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        XCTAssertEqual(output.first?.count, 8)
    }
    
    func test_Render_WhenGivenDeadCell_OutputDash(){
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 1, and: 1)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        XCTAssertEqual(output.first, "-")
        
    }
    
    func test_Render_WhenGivenAliveCell_OutputHash(){
        
        let mockCellGenerator = MockCellGenerator()
        let cells = [GameBoardCell(cellState: .alive)]
        mockCellGenerator.cellsList = cells
        _ = mockCellGenerator.generate(numberOfCells: Int(arc4random_uniform(20)))
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 1, and: 1, cellGenerator: mockCellGenerator)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        XCTAssertEqual(output.first, "#")
        
    }
    
    func test_Render_EmptyBoardOfResonableSiza_LooksOkToMyEyes_OutputDots(){
        
        let gameOfLifeBoard = GameOfLifeBoard(with: 20, and: 20)
        let output = sut.render(gameBoard: gameOfLifeBoard)
        
        for line in output {
            print(line)
        }
        
    }
    
}


extension GameBoardRendererTests {

    class MockCellGenerator : CellGenerationStrategy {
        
        var cellsList = [GameBoardCell]()
        
        func generate(numberOfCells numberOfCellsToGenerate: Int) -> [GameBoardCell] {
            
            if cellsList.count > 0 {
                return cellsList
            }
            
            let half = numberOfCellsToGenerate/2
            cellsList = Array.init(repeating: GameBoardCell(cellState: .alive), count: half)
            
            cellsList.append(contentsOf: Array.init(repeating: GameBoardCell(cellState: .dead), count: half))
            
            while cellsList.count != numberOfCellsToGenerate {
                cellsList.append(GameBoardCell(cellState: .dead))
            }
            return cellsList
        }
        
        
    }
}
