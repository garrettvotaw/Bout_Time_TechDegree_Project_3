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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 41.0/255.0, blue: 75.0/255.0, alpha: 1)
    }
    
    
    
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: swapValues(firstLabel: &eventOneLabel.text!, secondLabel: &eventTwoLabel.text!)
        case 1: swapValues(firstLabel: &eventTwoLabel.text!, secondLabel: &eventThreeLabel.text!)
        case 2: swapValues(firstLabel: &eventThreeLabel.text!, secondLabel: &eventFourLabel.text!)
        default: break
        }
    }

    @IBAction func upButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: swapValues(firstLabel: &eventTwoLabel.text!, secondLabel: &eventOneLabel.text!)
        case 1: swapValues(firstLabel: &eventThreeLabel.text!, secondLabel: &eventTwoLabel.text!)
        case 2: swapValues(firstLabel: &eventFourLabel.text!, secondLabel: &eventThreeLabel.text!)
        default: break
        }
    }
    
    //MARK: Helper Methods
    func swapValues( firstLabel: inout String, secondLabel: inout String) {
        var tempLabel: String
        tempLabel = firstLabel
        firstLabel = secondLabel
        secondLabel = tempLabel
    }
    
    
    
    
    

}

