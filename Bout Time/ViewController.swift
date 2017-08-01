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
        nextRoundButton.isHidden = true
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
        } else {
            setupHistoricalView()
            nextRoundButton.isHidden = true
        }
    }
    
    
    
    //*********************
    // MARK: Helper Methods
    //*********************
    
    func checkAnswer() {
        game.roundsAsked += 1
        if game.checkEvents(of: game.currentRoundsRandomEvents) {
            print("YAY ITS CORRECT")
            game.score += 1
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            nextRoundButton.isHidden = false
        } else {
            print ("nopes sorry")
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            nextRoundButton.isHidden = false
        }
    }
    
    func setupHistoricalView() {
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
        firstEventView.isHidden = true
        secondEventView.isHidden = true
        thirdEventView.isHidden = true
        fourthEventView.isHidden = true
        nextRoundButton.isHidden = true
        let alert = UIAlertController(title: "GAME OVER", message: "You beat \(game.score) out of \(game.roundsPerGame) rounds!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: {action in self.restartGame()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame() {
        print("Method Called")
        game.resetGame()
        firstEventView.isHidden = false
        secondEventView.isHidden = false
        thirdEventView.isHidden = false
        fourthEventView.isHidden = false
    }
    
}

