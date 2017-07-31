//
//  ViewController.swift
//  Bout Time
//
//  Created by Garrett Votaw on 7/23/17.
//  Copyright © 2017 Garrett Votaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventOneLabel: UILabel!
    @IBOutlet weak var eventTwoLabel: UILabel!
    @IBOutlet weak var eventThreeLabel: UILabel!
    @IBOutlet weak var eventFourLabel: UILabel!
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 41.0/255.0, blue: 75.0/255.0, alpha: 1)
        setupHistoricalView()
    }
    
    
    //*************************
    // MARK: Shake Gesture Code
    //*************************
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            //FIXME: Implement scoring
            checkAnswer()
            nextRound()
            print("I've been Shaken, not stirred!")
        }
    }
    
    
    //*****************
    // MARK: IBActions
    //*****************
    @IBAction func downButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: swap(&eventOneLabel.text!, &eventTwoLabel.text!)
        case 1: swap(&eventTwoLabel.text!, &eventThreeLabel.text!)
        case 2: swap(&eventThreeLabel.text!, &eventFourLabel.text!)
        default: break
        }
    }

    @IBAction func upButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: swap(&eventTwoLabel.text!, &eventOneLabel.text!)
        case 1: swap(&eventThreeLabel.text!, &eventTwoLabel.text!)
        case 2: swap(&eventFourLabel.text!, &eventThreeLabel.text!)
        default: break
        }
    }
    
    
    //*********************
    // MARK: Helper Methods
    //*********************
    func nextRound() {
        // FIXME: Implement Next Round Logic
        
    }
    
    func checkAnswer() {
        // FIXME: Implement Answer Checking
    }
    
    func setupHistoricalView() {
        // FIXME: Implement Historical View
        let randomEvents = game.getRandomDataSet(amount: game.eventsPerRound)
        eventOneLabel.text = randomEvents[0].event
        eventTwoLabel.text = randomEvents[1].event
        eventThreeLabel.text = randomEvents[2].event
        eventFourLabel.text = randomEvents[3].event
    }
    
    func showScore() {
        // FIXME: Show score (this is the end of the game)
    }
    
    func restartGame() {
        // FIXME: Implement restartGameLogic
    }
    
/* 
This was my own implentation of swapping the labels until I realized that Apple has already provided one lol
     
    func swapValues( firstLabel: inout String, secondLabel: inout String) {
        var tempLabel: String
        tempLabel = firstLabel
        firstLabel = secondLabel
        secondLabel = tempLabel
    } 
*/
    
}

