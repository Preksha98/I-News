//
//  TechnologyTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 01/04/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class TechnologyTableViewCell: UITableViewCell {

    @IBOutlet weak var tlbl: UILabel!
    @IBOutlet weak var timg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
