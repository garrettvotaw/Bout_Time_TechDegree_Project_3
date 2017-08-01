//
//  HistoricalEvent.swift
//  Bout Time
//
//  Created by Garrett Votaw on 7/31/17.
//  Copyright © 2017 Garrett Votaw. All rights reserved.
//

import Foundation

class HistoricalEvent {
    let event: String
    let year: Int
    var hasBeenUsed = false
    
    init(event: String, year: Int) {
        self.event = event
        self.year = year
    }
}
