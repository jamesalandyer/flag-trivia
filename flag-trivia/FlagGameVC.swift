//
//  FlagGameVC.swift
//  flag-trivia
//
//  Created by James Dyer on 4/20/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit

class FlagGameVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var highScoreLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var correctLbl: UILabel!
    @IBOutlet weak var incorrectLbl: UILabel!
    @IBOutlet weak var currentStreakLbl: UILabel!
    @IBOutlet weak var countryFlagImg: UIImageView!
    
    //Properties
    
    let game = Game()
    let flag = Flag()
    var currentFlag: String!
    var timer = NSTimer()
    var counter = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitBtn.layer.cornerRadius = 4
        submitBtn.clipsToBounds = true
        textField.delegate = self
        setNewImage()
    }
    
    override func viewDidAppear(animated: Bool) {
        textField.becomeFirstResponder()
        highScoreLbl.text = "\(game.highScore)"
        toggleTimer()
    }
    
    //Methods

    @IBAction func submitBtnPressed(sender: AnyObject) {
        if textField.text?.lowercaseString == currentFlag {
            game.correctAnswer()
            correctLbl.text = "\(game.numberCorrect)"
        } else {
            game.incorrectAnswer()
            incorrectLbl.text = "\(game.numberIncorrect)"
        }
        currentStreakLbl.text = "\(game.currentStreak)"
        checkToReset()
        toggleTimer()
        refreshFlag()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        submitBtnPressed(textField)
        return true
    }
    
    //Setting flag
    
    func setNewImage() {
        currentFlag = flag.currentFlag()
        countryFlagImg.image = UIImage(named: "\(currentFlag).png")
    }
    
    func refreshFlag() {
        textField.text = ""
        setNewImage()
    }
    
    //Timer
    
    func toggleTimer() {
        timer.invalidate()
        counter = 15
        timerLbl.text = ":\(NSString(format: "%02d", counter))"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(clock), userInfo: nil, repeats: true)
    }
    
    func clock() {
        counter -= 1
        timerLbl.text = ":\(NSString(format: "%02d", counter))"
        if counter == 0 {
            game.incorrectAnswer()
            incorrectLbl.text = "\(game.numberIncorrect)"
            currentStreakLbl.text = "\(game.currentStreak)"
            checkToReset()
            counter = 15
            toggleTimer()
            refreshFlag()
        }
    }
    
    //When to end game
    
    func checkToReset() {
        if game.totalFlags() == 24 {
            game.resetGame()
            flag.resetFlags()
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
