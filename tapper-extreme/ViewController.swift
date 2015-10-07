//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Jake Krajewski on 10/6/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var maxTaps = 0
    var currentTaps = 0
    

    // Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    @IBAction func onCoinTapped (sender: UIButton!) {
        
        if currentTaps <= maxTaps {
            currentTaps++
            updateTapLbl()
        }
        
        if isGameOver(){
            restartGame()
        }
        
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {

        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            // Hide visible UI
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            // Show coin and label
            tapBtn.hidden = false
            tapLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapLbl()
            
        }
    }
    func restartGame(){
        
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        // Show visible UI
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        // hide coin and label
        tapBtn.hidden = true
        tapLbl.hidden = true
        
        
    }
    
    func isGameOver() -> Bool{
        
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    // updating label
    func updateTapLbl(){
        tapLbl.text = "\(currentTaps) Taps"
    }
    
}

