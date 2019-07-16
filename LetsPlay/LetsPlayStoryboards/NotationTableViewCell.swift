//
//  NotationTableViewCell.swift
//  LetsPlayStoryboards
//
//  Created by Christian Marino on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit

class NotationTableViewCell: UITableViewCell {

    
    var assocKey : String = "";
    var i : Int = 0;
    @IBOutlet var notationStringLabel: UILabel!
    let ud = UserDefaults.standard;
    let kk = "PreferredNotation";
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        if i != 0{
            
            print("Entro qui, selezione fatta");
            ud.set(assocKey, forKey: kk);
            let tw = self.superview as! UITableView;
            let twn = tw.next as! NotationTableViewController;
            let i = twn.navigationController as! UINavigationController;
            i.popViewController(animated: false);
            
//            twn.updateChecked();
        }
        i+=1;
//        (self.superview as! NotationTableViewController).updateChecked(assocKey);
        
        
        // Configure the view for the selected state
    }

}
