//
//  ScienceTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 31/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class ScienceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sclbl: UILabel!
    @IBOutlet weak var scimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
