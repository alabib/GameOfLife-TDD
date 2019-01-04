//
//  GameBoardCell.swift
//  GameOfLife
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import Foundation

enum CellState: Int {
    case dead
    case alive
    case permanentlyDead
}

struct  GameBoardCell : Equatable {
    
    var cellState: CellState = .dead
    var x : Int!
    var y : Int!
  
    init(cellState: CellState,
         x: Int? = nil, y: Int? = nil) {
        self.cellState = cellState
        self.x = x ?? 0
        self.y = y ?? 0
    }
    
    public static func ==(lhs: GameBoardCell, rhs: GameBoardCell) -> Bool {
        if lhs.cellState != rhs.cellState {
            return false
        }
        if lhs.x != rhs.x {
            return false
        }
        if lhs.y != rhs.y {
            return false
        }
        return true
    }
}
