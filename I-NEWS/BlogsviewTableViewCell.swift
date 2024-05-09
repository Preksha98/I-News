//
//  BlogsviewTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 04/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class BlogsviewTableViewCell: UITableViewCell {

    @IBOutlet weak var bloglbl: UILabel!
    @IBOutlet weak var blogimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
