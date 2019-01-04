//
//  GameBoardRenderer.swift
//  GameOfLife
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import Foundation

class GameBoardRenderer {

    func render(gameBoard:GameOfLifeBoard)-> [String] {
        
        var outputLine = [String]()

        for row in gameBoard.rows {
            
            var thisRow = ""
            for cell in row {
                
                switch cell.cellState {
                case .dead:
                    thisRow.append("-")
                case .alive:
                    thisRow.append("#")
                case .permanentlyDead:
                    thisRow.append("X")
                }
                
            }
            outputLine.append(thisRow)
        }
        
        return outputLine
    }
}
