//
//  LanguageCellTableViewCell.swift
//  LetsPlayStoryboards
//
//  Created by Christian Marino on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit

class LanguageCellTableViewCell: UITableViewCell {

    
    @IBOutlet var langName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
