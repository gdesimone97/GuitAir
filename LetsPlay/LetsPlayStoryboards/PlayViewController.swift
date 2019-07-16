//
//  playViewController.swift
//  LetsPlayStoryboards
//
//  Created by Giuseppe De Simone on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit

class playViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
