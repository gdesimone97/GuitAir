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

class WatchController: WKInterfaceController, MotionManagerDelegate {
    let session = WCSession.default
    var connectionStatus: Bool = false
    var sessionStatus: WCSessionActivationState {
        get {
            return session.activationState
        }
    }
    
    @IBOutlet weak var stateLabel: WKInterfaceLabel!
    @IBOutlet weak var playingTimer: WKInterfaceTimer!
    @IBOutlet weak var warningLabel: WKInterfaceLabel!
    
    var manager = MotionManager()
    lazy var watchSession = SessionManager(sessionDelegate: self)
    
    func updatedRead(sound: Bool) {
        sendData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        manager.delegate = self
        
        WKExtension.shared().isAutorotating = true
        WKExtension.shared().isFrontmostTimeoutExtended = true
        
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
        sleep(2)
        connectionStatus = checkConnection()
        self.setTitle("")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension WatchController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        stateLabel.setText("Connected to the iPhone!\nReady to play")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if message["payload"] as! String == "start" {
            manager.startUpdates()
            presentController(withName: "playingScene", context: nil)
//            playingTimer.start()
        }
        else if message["payload"] as! String == "stop" {
            manager.stopUpdates()
            presentController(withName: "mainScene", context: nil)
//            playingTimer.stop()
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        if !checkConnection() {
//            playingTimer.stop()
            warningLabel.setText("Warning! iPhone disconnected")
        }
        else {
//            playingTimer.start()
            warningLabel.setText("")
        }
    }
}

extension WatchController {
    func checkConnection() -> Bool{
        guard self.sessionStatus == WCSessionActivationState.activated else {
            stateLabel.setText("Connection not available")
            return false
        }
        guard self.session.isReachable else {
            if  self.session.iOSDeviceNeedsUnlockAfterRebootForReachability {
                stateLabel.setText("iPhone not reacheable!")
            }
            return false
        }
        return true
    }
    
    func sendData() {
        watchSession.sendMessage(["payload": "1"])
    }
}
