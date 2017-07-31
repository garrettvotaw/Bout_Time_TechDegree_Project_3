//
//  Game.swift
//  Bout Time
//
//  Created by Garrett Votaw on 7/25/17.
//  Copyright © 2017 Garrett Votaw. All rights reserved.
//

import Foundation
import GameKit

struct Game {
    var roundsPerGame: Int = 6
    let eventsPerRound = 4
    var historicalDataSet = [HistoricalEvent(event: "Steve Jobs announces iPhone", year: 2007),
        HistoricalEvent(event: "Swift is Announced", year: 2014),
        HistoricalEvent(event: "War of 1812", year: 1812),
        HistoricalEvent(event: "Garrett was born", year: 1993),]
    
    
    // FREAKING BOOYAH SUCKA I DID IT!!!!!
    func getRandomDataSet(amount: Int) -> [HistoricalEvent] {
        var randomEvents:[HistoricalEvent] = []
        while randomEvents.count < amount {
            let indexOfRandomEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalDataSet.count)
            let randomEvent = historicalDataSet[indexOfRandomEvent]
            if randomEvent.hasBeenUsed == false {
                randomEvents.append(randomEvent)
                randomEvent.hasBeenUsed = true
            }
        }
        return randomEvents
    }
}

class HistoricalEvent {
    let event: String
    let year: Int
    var hasBeenUsed = false
    
    init(event: String, year: Int) {
        self.event = event
        self.year = year
    }
}
