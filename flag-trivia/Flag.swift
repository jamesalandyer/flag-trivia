//
//  Flag.swift
//  flag-trivia
//
//  Created by James Dyer on 4/20/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation

class Flag {
    
    //Properties
    
    private var _counter: Int = 0
    private var _flags: [String] = ["australia", "brazil", "canada", "china", "cuba", "france", "germany", "greece", "guatemala", "ireland", "italy", "jamaica", "japan", "mexico", "morocco", "portugal", "russia", "south korea", "spain", "switzerland", "turkey", "united kingdom", "united states", "vietnam"]
    
    //Methods
    
    func currentFlag() -> (String) {
        let current: String = _flags[_counter]
        _counter += 1
        
        return current
    }
    
    func resetFlags() {
        _counter = 0
    }
}
