//
//  ViewController.swift
//  flag-trivia
//
//  Created by James Dyer on 4/20/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var highScoreLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startBtn.layer.cornerRadius = startBtn.frame.width / 2
        startBtn.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        highScoreLbl.text = "\(Game().highScore)"
    }

}

