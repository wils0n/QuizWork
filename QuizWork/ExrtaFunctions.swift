//
//  ExrtaFunctions.swift
//  QuizWork
//
//  Created by Wilson Mejía on 16/03/16.
//  Copyright © 2016 NinjaLABS. All rights reserved.
//

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}