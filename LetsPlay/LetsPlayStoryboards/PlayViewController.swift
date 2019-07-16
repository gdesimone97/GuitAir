//
//  playViewController.swift
//  LetsPlayStoryboards
//
//  Created by Giuseppe De Simone on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit

class playViewController: UIViewController {
    
    let USER_DEFAULT_KEY_STRING = "chords_string"
    var userDefault = UserDefaults.standard
    @IBOutlet weak var redButtonChord: UILabel!
    
    @IBOutlet weak var blueButtonChord: UILabel!
    
    @IBOutlet weak var greenButtonChord: UILabel!
    
    @IBOutlet weak var pinkButtonChord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Label rotation in game mode
        redButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        blueButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        greenButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        pinkButtonChord?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let testUserDefault = userDefault.array(forKey: USER_DEFAULT_KEY_STRING) {
            var userData = testUserDefault as! Array<String>
            redButtonChord.text = userData[0]
            blueButtonChord.text = userData[1]
            greenButtonChord.text = userData[2]
            pinkButtonChord.text = userData[3]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
