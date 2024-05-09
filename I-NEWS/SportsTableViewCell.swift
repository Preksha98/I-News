//
//  SportsTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 19/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    @IBOutlet weak var stxt: UILabel!
    @IBOutlet weak var simg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
