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
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var firstEventView: UIView!
    @IBOutlet weak var secondEventView: UIView!
    @IBOutlet weak var thirdEventView: UIView!
    @IBOutlet weak var fourthEventView: UIView!
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
        }
    }
    
    
    //*****************
    // MARK: IBActions
    //*****************
    @IBAction func downButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            swap(&game.currentRoundsRandomEvents[0], &game.currentRoundsRandomEvents[1])
            updateLabels()
        } else if sender.tag == 1 {
            swap(&game.currentRoundsRandomEvents[1], &game.currentRoundsRandomEvents[2])
            updateLabels()
        } else if sender.tag == 2 {
            swap(&game.currentRoundsRandomEvents[2], &game.currentRoundsRandomEvents[3])
            updateLabels()
        }
    }

    @IBAction func upButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            swap(&game.currentRoundsRandomEvents[1], &game.currentRoundsRandomEvents[0])
            updateLabels()
        } else if sender.tag == 1 {
            swap(&game.currentRoundsRandomEvents[2], &game.currentRoundsRandomEvents[1])
            updateLabels()
        } else if sender.tag == 2 {
            swap(&game.currentRoundsRandomEvents[3], &game.currentRoundsRandomEvents[2])
            updateLabels()
        }
    }
    
    @IBAction func nextRound(_ sender: Any) {
        if game.roundsAsked == game.roundsPerGame {
            // Game Over
            showScore()
            // Hide all the Labels that don't matter
            firstEventView.isHidden = true
            secondEventView.isHidden = true
            thirdEventView.isHidden = true
            fourthEventView.isHidden = true
        } else {
            setupHistoricalView()
            nextRoundButton.isHidden = true
        }
    }
    
    
    
    //*********************
    // MARK: Helper Methods
    //*********************
    
    func checkAnswer() {
        // FIXME: Finish implementing
        // don't forget to change the nextRound image based on if the question is right or wrong
        if game.checkEvents(of: game.currentRoundsRandomEvents) {
            print("YAY ITS CORRECT")
        } else {
            print ("nopes sorry")
        }
    }
    
    func setupHistoricalView() {
        // FIXME: Implement Historical View
        game.currentRoundsRandomEvents = game.getRandomDataSet()
        eventOneLabel.text = game.currentRoundsRandomEvents[0].event
        eventTwoLabel.text = game.currentRoundsRandomEvents[1].event
        eventThreeLabel.text = game.currentRoundsRandomEvents[2].event
        eventFourLabel.text = game.currentRoundsRandomEvents[3].event
    }
    
    func updateLabels() {
        eventOneLabel.text = game.currentRoundsRandomEvents[0].event
        eventTwoLabel.text = game.currentRoundsRandomEvents[1].event
        eventThreeLabel.text = game.currentRoundsRandomEvents[2].event
        eventFourLabel.text = game.currentRoundsRandomEvents[3].event
    }
    
    func showScore() {
        // FIXME: Show score (this is the end of the game)
    }
    
    func restartGame() {
        // FIXME: Implement restartGameLogic
    }
    
}

