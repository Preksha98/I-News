//
//  GameTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 08/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gamelbl: UILabel!
    @IBOutlet weak var gameimg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
