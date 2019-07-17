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

    let userDefault = UserDefaults.standard
    let USER_DEFAULT_KEY_STRING = "chords_string"
    var userDataChords: Array<String>?

//    Pairing status "led"
    @IBOutlet weak var deviceStatus: UIView!


    // Chords name displayed in home
    @IBOutlet weak var firstChordLabel: UILabel!
    @IBOutlet weak var secondChordLabel: UILabel!
    @IBOutlet weak var thirdChordLabel: UILabel!
    @IBOutlet weak var fourthChordLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        deviceStatus?.layer.cornerRadius = 8.34

        // Updating of chords label
        //fourthChordLabel?.text = "Gm"

//        check for Watch Pairing and Session status
        if SessionManager.manager.isSessionSupported(){
            if SessionManager.manager.getPairingState(){
                let x = SessionManager.manager.getSessionActivationState()
//            Here session.session is surely not nil
                if x == WCSessionActivationState.notActivated || x == WCSessionActivationState.inactive{
                    deviceStatus?.backgroundColor = .yellow
                }
                else{
                    //                Session activation state is surely "active"
                    deviceStatus?.backgroundColor = .green
                }
            }
            else{
                deviceStatus?.backgroundColor = .red
                print("Watch not paired")
            }
        }else{
            print("Session is not supported")
            deviceStatus?.backgroundColor = .red
        }


}

//    Send start message to Watch when "play" button is pressed
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if SessionManager.manager.isSessionSupported(){
            SessionManager.manager.sendNoHandlers(["start": 1])
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if let testUserDefault = userDefault.array(forKey: USER_DEFAULT_KEY_STRING) {
            var userData = testUserDefault as! Array<String>
            userDataChords = userData
            DispatchQueue.main.async {
            self.firstChordLabel.text = userData [0]
            self.secondChordLabel.text = userData [1]
            self.thirdChordLabel.text = userData [2]
            self.fourthChordLabel.text = userData [3]
            }
        }
        else {
            firstChordLabel.text = ""
            secondChordLabel.text = ""
            thirdChordLabel.text = ""
            fourthChordLabel.text = ""
        }
    }

    

}
