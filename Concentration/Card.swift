//
//  Card.swift
//  Concentration
//
//  Created by Nicolai Vatne on 24/08/2019.
//  Copyright © 2019 Nicolai Vatne. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

