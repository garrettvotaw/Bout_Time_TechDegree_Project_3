//
//  Game.swift
//  Bout Time
//
//  Created by Garrett Votaw on 7/25/17.
//  Copyright © 2017 Garrett Votaw. All rights reserved.
//

import Foundation
import GameKit

class Game {
    let roundsPerGame: Int = 6
    var roundsAsked: Int = 0
    var score: Int = 0
    let eventsPerRound = 4
    var timeLeft: Int = 60
    var currentRoundsRandomEvents: [HistoricalEvent] = []
    var historicalDataSet = [HistoricalEvent(event: "Steve Jobs announces iPhone", year: 2007),
            HistoricalEvent(event: "Swift is Announced", year: 2014),
            HistoricalEvent(event: "Newton MessagePad Introduced", year: 1993),
            HistoricalEvent(event: "Internet was invented", year: 1979),
            HistoricalEvent(event: "Apple I Introduced", year: 1976),
            HistoricalEvent(event: "Mac Mini Introduced", year: 2005),
            HistoricalEvent(event: "iBook Introduced", year: 1999),
            HistoricalEvent(event: "iPod Introduced", year: 2001),
            HistoricalEvent(event: "Airport Extreme Introduced", year: 2003),
            HistoricalEvent(event: "MacBook Pro Introduced", year: 2006),
            HistoricalEvent(event: "iMac Introduced", year: 1998),
            HistoricalEvent(event: "iPad Introduced", year: 2010),
            HistoricalEvent(event: "Macintosh System Software Introduced", year: 1984),
            HistoricalEvent(event: "Apple Watch Introduced", year: 2015),
            HistoricalEvent(event: "MacBook Air Introduced", year: 2008),
            HistoricalEvent(event: "eMac Introduced", year: 2002),
            HistoricalEvent(event: "Tim Cook becomes Apple CEO", year: 2012),
            HistoricalEvent(event: "iPhone 7 Introduced", year: 2017),
            HistoricalEvent(event: "OSX Introduced", year: 2001),
            HistoricalEvent(event: "Apple Thunderbolt Display Introduced", year: 2011),
            HistoricalEvent(event: "Magic Mouse Introduced", year: 2009),
            HistoricalEvent(event: "PowerBook Introduced", year: 1989),
            HistoricalEvent(event: "Macintosh Introduced", year: 1984),
            HistoricalEvent(event: "iPod Mini", year: 2004),
            HistoricalEvent(event: "Apple QuickTake 200 Introduced", year: 1997),
            HistoricalEvent(event: "Apple II Introduced", year: 1977)]
    
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
    
    func resetGame() {
        for event in historicalDataSet {
            event.hasBeenUsed = false
        }
        score = 0
        roundsAsked = 0
    }
    
    
    
    
}
