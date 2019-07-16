//
//  ViewController.swift
//  LetsPlayStoryboards
//
//  Created by Christian Marino on 14/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController{
    
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
    
//    WatchSession-related variable
    var sessionManager: SessionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // If device is paried, the background color will be green, if not it will be yellow
        deviceStatus?.backgroundColor = UIColor(red: 0.3, green: 1, blue: 0.17, alpha: 1) //FORSE ORA SI PUO' CANCELLARE
        deviceStatus?.layer.cornerRadius = 8.34
        
        
        // Label rotation in game mode
        
        
        redButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        blueButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        greenButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        pinkButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        // Updating of chords label 
        fourthChordLabel?.text = "Gm"
        
//        check for Watch Pairing and Session status
        sessionManager = SessionManager() //FORSE E' DA METTERE NELL'APP DELEGATE, DIPENDE DA COME GESTIAMO L'APPARIZIONE DELLE VISTE
        if let status = sessionManager.session?.isPaired{
            if status{
//            Here session.session is surely not nil
                if sessionManager.session!.activationState == WCSessionActivationState.notActivated || sessionManager.session!.activationState == WCSessionActivationState.inactive{
                    deviceStatus.backgroundColor = .yellow
                }
                else{
//                Session activation state is surely "active"
                    deviceStatus.backgroundColor = .green
                }
            }
            else{
                deviceStatus.backgroundColor = .red
                print("Watch not paired")
            }
        }
        else{
            print("Could not determine pairing state")
        }
    }
    
//    Send start message to Watch when "play" button is pressed
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if let x = sessionManager.session{
            x.sendMessage(["start": 1], replyHandler: nil, errorHandler: nil)
        }else{
            print("Session is nil")
        }
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
        if let x = sessionManager.session{
            x.sendMessage(["stop": 1], replyHandler: nil, errorHandler: nil)
        }else{
            print("Session is nil")
        }
    }
    
}

