//
//  MotionManager.swift
//  Test WatchKit Extension
//
//  Created by Francesco Chiarello on 11/07/2019.
//  Copyright © 2019 Francesco Chiarello. All rights reserved.
//

import Foundation
import CoreMotion
import WatchKit

/**
 `MotionManagerDelegate` exists to inform delegates of motion changes.
 These contexts can be used to enable application specific behavior.
 */
protocol MotionManagerDelegate: class {
    func updatedRead(sound: Bool)
}

class MotionManager {
    // MARK: Properties
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    var buffer = RunningBuffer(size: 2)
//    var buffer_pitch = RunningBuffer(size: 50)
    
    var flag: Bool = false
    var flag1: Bool = false
    
    
    // MARK: Application Specific Constants
    
    let startThreshold = 3.00
    let soundThreshold = 2.00
    let raisingThreshold = 2.00
    
    
    // The app is using 50hz data and the buffer is going to hold 1s worth of data.
    let sampleInterval = 1.0 / 100
    
    weak var delegate: MotionManagerDelegate?
    
    
    // MARK: Initialization
    
    init() {
        // Serial queue for sample handling and calculations.
        queue.maxConcurrentOperationCount = 1
        queue.name = "MotionManagerQueue"
    }
    
    // MARK: Motion Manager
    
    func startUpdates() {
        if !motionManager.isDeviceMotionAvailable {
            print("Device Motion is not available.")
            return
        }
        
        motionManager.deviceMotionUpdateInterval = sampleInterval
        motionManager.startDeviceMotionUpdates(to: queue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if error != nil {
                print("Encountered error: \(error!)")
            }
            
            if let data = deviceMotion?.rotationRate {
                let x = data.x
                let z = data.z
                
                if self.flag1 && x < self.raisingThreshold && z > self.raisingThreshold {
                    self.flag1 = false
                }
                
                if !self.flag1 && !self.flag && x > self.startThreshold && z < -self.startThreshold {
                    self.flag = true
                    self.flag1 = true
                }
                
                if self.flag && deviceMotion != nil {
                    self.processDeviceMotion(x: x, z: z)
                }
            }
        }
    }
    
    func stopUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    // MARK: Motion Processing
    
    func processDeviceMotion(x: Double, z: Double) {
        
        let sum = (-x + z*2)/3
        
        
//        buffer.addSample(sum)
        
//        if !buffer.isFull() {
//            return
//        }
        flag = false
        
//        let sumAvg = buffer.sum()/2
        
//        buffer.reset()
//        buffer_pitch.reset()
        
        delegate!.updatedRead(sound: sum >= soundThreshold)
        
//        print("yawMin: " + String(format: "%.3f", yawMin) + " yawMax: " + String(format: "%.3f", yawMax) + " yawAvg: " + String(format: "%.3f", yawAvg) + " - pitchMin: " + String(format: "%.3f", pitchMin) + " pitchMax: " + String(format: "%.3f", pitchMax) + " pitchAvg: " + String(format: "%.3f", pitchAvg))
       
    }
    
}
