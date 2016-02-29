//
//  RandomGenerator2D.swift
//  NutsCrush
//
//  Created by Zheng Gao on 2/28/16.
//  Copyright © 2016 Zheng Gao. All rights reserved.
//

import Foundation

class Point2D {
    var x:Int = 0
    var y:Int = 0

    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
}

class RandomGenerator2D {
    static func getRandom2D(xMin:Int, xMax:Int, yMin:Int, yMax:Int) -> Point2D {
        let xResult:Int = Int(arc4random_uniform(UInt32(xMax - xMin + 1))) + xMin
        let yResult:Int = Int(arc4random_uniform(UInt32(yMax - yMin + 1))) + yMin
        return Point2D(x:xResult, y:yResult)
    }
}