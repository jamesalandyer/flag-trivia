//
//  Game.swift
//  flag-trivia
//
//  Created by James Dyer on 4/20/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation

class Game {
    
    //Properties
    
    private var _highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("HighScore")
    private var _currentStreak: Int = 0
    private var _numberCorrect: Int = 0
    private var _numberIncorrect: Int = 0
    
    var highScore: Int {
        return _highScore
    }
    
    var currentStreak: Int {
        return _currentStreak
    }
    
    var numberCorrect: Int {
        return _numberCorrect
    }
    
    var numberIncorrect: Int {
        return _numberIncorrect
    }
    
    //Methods
    
    func totalFlags() -> Int {
        return numberCorrect + numberIncorrect
    }
    
    func updateHighScore(score: Int) {
        if score > highScore {
            _highScore = score
            NSUserDefaults.standardUserDefaults().setValue(_highScore, forKey: "HighScore")
        }
    }
    
    func incorrectAnswer() {
        _numberIncorrect += 1
        _currentStreak = 0
    }
    
    func correctAnswer() {
        _numberCorrect += 1
        _currentStreak += 1
    }
    
    func resetGame() {
        updateHighScore(_numberCorrect)
        _currentStreak = 0
        _numberCorrect = 0
        _numberIncorrect = 0
    }
    
}