//
//  SessionDelegate.swift
//  LetsPlayStoryboards
//
//  Created by Francesco Chiarello on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import WatchConnectivity

class SessionManager: NSObject{
    
    static var manager: SessionManager = SessionManager()
    private static var session: WCSession?
    
    private override init() {
        super.init()
        if WCSession.isSupported(){
            SessionManager.session = WCSession.default
//            session is surely not nil
            SessionManager.session!.delegate = self
            SessionManager.session!.activate()
        }else{
            SessionManager.session = nil
        }
    }
    
    func isSessionSupported() -> Bool{
        return SessionManager.session != nil
    }
    
//    Must be called only if session is surely supported (for example, after a call to isSessionSupported)
    func getSessionActivationState() -> WCSessionActivationState{
        return SessionManager.session!.activationState
    }
//    Must be called only if session is surely supported (for example, after a call to isSessionSupported)
    func sendNoHandlers(_ toSend: [String: Any]){
        SessionManager.session!.sendMessage(toSend, replyHandler: nil, errorHandler: nil)
    }
//    Must be called only if session is surely supported (for example, after a call to isSessionSupported)
    func getPairingState() -> Bool{
        return SessionManager.session!.isPaired
    }
    
    func setDelegate(_ delegate: WCSessionDelegate){
        SessionManager.session!.delegate = delegate
    }
}



//extension to support WCSessionDelegate
extension SessionManager: WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    /*
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]){
        guard message["payload"] as! String == "1" else{
            print("Payload non è 1")
            return
        }
        GameModeViewController.play()
    }
 */
    
}

 
