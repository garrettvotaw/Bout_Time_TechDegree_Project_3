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
    var roundsAsked: Int = 0
    let eventsPerRound = 4
    var currentRoundsRandomEvents: [HistoricalEvent] = []
    var historicalDataSet = [HistoricalEvent(event: "Steve Jobs announces iPhone", year: 2007),
        HistoricalEvent(event: "Swift is Announced", year: 2014),
        HistoricalEvent(event: "War of 1812", year: 1812),
        HistoricalEvent(event: "Garrett was born", year: 1993),]
    
    //gets random events equal to the number of events per round
    func getRandomDataSet() -> [HistoricalEvent] {
        var randomEvents:[HistoricalEvent] = []
        while randomEvents.count < eventsPerRound {
            let indexOfRandomEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalDataSet.count)
            let randomEvent = historicalDataSet[indexOfRandomEvent]
            if randomEvent.hasBeenUsed == false {
                randomEvents.append(randomEvent)
                randomEvent.hasBeenUsed = true
            }
        }
        return randomEvents
    }
    
    //checks the correctness of the changed array
    func checkEvents(of array:[HistoricalEvent]) -> Bool {
        if array[0].year < array[1].year
            && array[1].year < array[2].year
            && array[2].year < array[3].year {
            return true
        } else { return false }
    }
    
    
    
    
}
