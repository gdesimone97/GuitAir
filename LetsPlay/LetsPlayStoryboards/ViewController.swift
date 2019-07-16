//
//  ViewController.swift
//  LetsPlayStoryboards
//
//  Created by Christian Marino on 14/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userDefault = UserDefaults.standard
    let USER_DEFAULT_KEY = "chords"
    
    @IBOutlet weak var deviceStatus: UIView!
    
    
    // Chords name displayed in home
    
    @IBOutlet weak var firstChordLabel: UILabel!
    
    @IBOutlet weak var secondChordLabel: UILabel!
    
    @IBOutlet weak var thirdChordLabel: UILabel!
    
    @IBOutlet weak var fourthChordLabel: UILabel!
    
    
    // Labels shown in game mode, each label is associated with a button
    
    @IBOutlet weak var redButtonChord: UILabel!
    
    @IBOutlet weak var blueButtonChord: UILabel!
    
    @IBOutlet weak var greenButtonChord: UILabel!
    
    @IBOutlet weak var pinkButtonChord: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // If device is paried, the background color will be green, if not it will be yellow
        deviceStatus?.backgroundColor = UIColor(red: 0.3, green: 1, blue: 0.17, alpha: 1)
        deviceStatus?.layer.cornerRadius = 8.34
        
        if let testUserDefault = userDefault.array(forKey: USER_DEFAULT_KEY) {
            firstChordLabel.text = 
        }
        
        // Label rotation in game mode
        
        
        redButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        blueButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        greenButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        pinkButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        // Updating of chords label 
        fourthChordLabel?.text = "Gm"
    }

}

