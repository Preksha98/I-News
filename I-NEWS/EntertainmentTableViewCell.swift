//
//  EntertainmentTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 31/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class EntertainmentTableViewCell: UITableViewCell {

    @IBOutlet weak var elbl: UILabel!
    
    @IBOutlet weak var eimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
