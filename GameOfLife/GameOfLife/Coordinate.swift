//
//  Coordinates.swift
//  GameOfLife
//
//  Created by Ahmed Labib on 3/19/18.
//  Copyright © 2018 AhmedLabib. All rights reserved.
//

import Foundation

struct  Coordinate : Equatable {
    
    var x : Int!
    var y : Int!
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
        if lhs.x != rhs.x {
            return false
        }
        if lhs.y != rhs.y {
            return false
        }
        return true
    }
}
