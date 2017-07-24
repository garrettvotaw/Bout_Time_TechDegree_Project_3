//
//  ViewController.swift
//  Bout Time
//
//  Created by Garrett Votaw on 7/23/17.
//  Copyright © 2017 Garrett Votaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 41.0/255.0, blue: 75.0/255.0, alpha: 1)
        textView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

