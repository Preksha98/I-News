//
//  AdminviewTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 12/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class AdminviewTableViewCell: UITableViewCell {
    var obj : commentsdata?
    var object : Likesmodal?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imgadmin: UIImageView!
    
    @IBOutlet weak var lbladmin: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
