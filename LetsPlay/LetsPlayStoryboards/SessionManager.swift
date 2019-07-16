//
//  SessionDelegate.swift
//  LetsPlayStoryboards
//
//  Created by Francesco Chiarello on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import WatchConnectivity

class SessionManager: NSObject, WCSessionDelegate {
    
    var session: WCSession?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
//            Here I'm sure that session is initialized
            session!.delegate = self
            session!.activate()
        }
        else{
            print("WCSession not supported")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

}
