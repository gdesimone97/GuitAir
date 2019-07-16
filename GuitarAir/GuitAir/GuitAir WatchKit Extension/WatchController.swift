//
//  WatchController.swift
//  GuitAir WatchKit Extension
//
//  Created by Gennaro Giaquinto on 16/07/2019.
//  Copyright © 2019 Gennaro Giaquinto. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class WatchController: WKInterfaceController {
    
    @IBOutlet weak var stateLabel: WKInterfaceLabel!
    @IBOutlet weak var playingTimer: WKInterfaceTimer!
    
    var manager: MotionManager!
    lazy var watchSession = SessionManager(sessionDelegate: self)
    
    func updatedRead(sound: Bool) {
        sendData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        WKExtension.shared().isAutorotating = true
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func sendData() {
        watchSession.sendMessage(["payload": "1"])
    }

}

extension WatchController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        stateLabel.setText("Connected to the iPhone!\nReady to play")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if message["payload"] as! String ==  "start" {
            manager.startUpdates()
            presentController(withName: "playingScene", context: nil)
            playingTimer.start()
        }
        else if message["payload"] as! String == "stop" {
            manager.stopUpdates()
            presentController(withName: "mainScene", context: nil)
            playingTimer.stop()
        }
    }
    
}
