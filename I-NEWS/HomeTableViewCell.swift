//
//  HomeTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 18/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var myimg: UIImageView!
    @IBOutlet weak var catename: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
