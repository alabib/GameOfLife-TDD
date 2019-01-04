//
//  CellGenerator.swift
//  GameOfLife
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import Foundation

protocol CellGenerationStrategy {
    func generate(numberOfCells numberOfCellsToGenerate: Int) -> [GameBoardCell]
}

class CellGenerator: CellGenerationStrategy {
    
    func generate(numberOfCells numberOfCellsToGenerate: Int) -> [GameBoardCell] {
        
        let half = numberOfCellsToGenerate/2
        var list = Array.init(repeating: GameBoardCell(cellState: .alive), count: half)
        list.append(contentsOf: Array.init(repeating: GameBoardCell(cellState: .dead), count: half))
        while list.count != numberOfCellsToGenerate {
            list.append(GameBoardCell(cellState: .dead))
        }
        
        return list.shuffled()
    }
}
