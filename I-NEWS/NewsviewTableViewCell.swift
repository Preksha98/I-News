//
//  NewsviewTableViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 04/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class NewsviewTableViewCell: UITableViewCell {
    var obj : commentsdata?
    var object : Likesmodal?
    @IBOutlet weak var btndeo: UIButton!
    //    @IBAction func onnewsimg(_ sender: Any) {
//    }
    @IBOutlet weak var newsview: UILabel!
    @IBOutlet weak var imgnv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btncomm(_ sender: Any) {
        
        obj?.Comm(obj: object!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
