//
//  GameOfLifeBoard.swift
//  GameOfLife
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import Foundation

class GameOfLifeBoard {
    
    private private(set) var cellGenerator: CellGenerationStrategy
    
    public private(set) var width: Int
    public private(set) var height: Int
    public var rows  = [[GameBoardCell]]()
    
    init(with width: Int, and height: Int, cellGenerator: CellGenerationStrategy? = nil) {
        self.width = width
        self.height = height
        self.cellGenerator = cellGenerator ?? CellGenerator()
        
        self.generateState()
    }
    
    func generateState() {
        var collectionOfCells = cellGenerator.generate(numberOfCells: width*height)
        for y in 0 ..< height {
            var row = [GameBoardCell]()
            for x in 0 ..< width {
                var cell = collectionOfCells.remove(at: 0)
                cell.x = x
                cell.y = y
                row.append(cell)
            }
            rows.append(row)
        }
    }
    
    func step() {
        
        var targetState = [[GameBoardCell]]()
        for row in rows {
            var targetRow = [GameBoardCell]()
            for cell in row {
                
                let newCellState = determineCellState(cell)
                targetRow.append(newCellState)
            }
            targetState.append(targetRow)
        }
        
        rows = targetState
    }
    
    private func determineCellState(_ cell: GameBoardCell) -> GameBoardCell {
        let neighbours = getNeighbours(ofCell: cell)
        
        let numberOFAliveNeighbours = (neighbours.filter{ $0.cellState == .alive }).count
        
        if cell.cellState == .alive {
            
            // a living cell with 2 or 3 neighbors continues living
            if  numberOFAliveNeighbours == 2 || numberOFAliveNeighbours == 3{
                return GameBoardCell(cellState: .alive, x: cell.x, y: cell.y)
            }
            
            // a living cell with 1 or less neighbors dies
            if  numberOFAliveNeighbours < 2{
                return GameBoardCell(cellState: .dead, x: cell.x, y: cell.y)
            }
            
            // a living cell with 4 or more neighbors dies
            if  numberOFAliveNeighbours > 3{
                return GameBoardCell(cellState: .dead, x: cell.x, y: cell.y)
            }
        }
        
        if cell.cellState == .dead  {
            
            // a dead cell with 3 neighbors starts to live
            if  numberOFAliveNeighbours == 3{
                return GameBoardCell(cellState: .alive, x: cell.x, y: cell.y)
            }
            
            
            // a dead cell with 4 or more neighbors becomes permanently dead
            if  numberOFAliveNeighbours == 4{
                return GameBoardCell(cellState: .permanentlyDead, x: cell.x, y: cell.y)
            }
            
            if  numberOFAliveNeighbours > 4{
                return GameBoardCell(cellState: .permanentlyDead, x: cell.x, y: cell.y)
            }
        }
        
        // a permanently dead cell stays permanently dead
        if cell.cellState == .permanentlyDead {
            return GameBoardCell(cellState: .permanentlyDead, x: cell.x, y: cell.y)
        }
        
        return GameBoardCell(cellState: .dead, x: cell.x, y: cell.y)
    }
    
    func getNeighbours(ofCell cell:GameBoardCell) -> [GameBoardCell] {
        var neighbours = [GameBoardCell]()
        var coordinates : [Coordinate] {
            return [
                Coordinate(x: cell.x-1, y: cell.y-1),
                Coordinate(x: cell.x-1, y: cell.y),
                Coordinate(x: cell.x-1, y: cell.y+1),
                
                Coordinate(x: cell.x, y: cell.y-1),
                Coordinate(x: cell.x, y: cell.y+1),
                
                Coordinate(x: cell.x+1, y: cell.y-1),
                Coordinate(x: cell.x+1, y: cell.y),
                Coordinate(x: cell.x+1, y: cell.y+1)
            ]
        }
        for coordinate in coordinates {
            if coordinate.x < 0 || coordinate.x >= width{
                continue
            }
            
            if coordinate.y < 0 || coordinate.y >= height {
                continue
            }
            neighbours.append(rows[coordinate.y][coordinate.x])
        }
        
        return neighbours
    }
}
