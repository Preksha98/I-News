//
//  NewsCollectionViewCell.swift
//  I-NEWS
//
//  Created by Prexa Patel on 19/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell  {
    
    @IBOutlet weak var lbldes: UILabel!
    @IBOutlet weak var newsdes: UILabel!
    @IBOutlet weak var newsimg: UIImageView!
    
    
    override func awakeFromNib() {
        newsdes.textAlignment = .natural
    }
   // @IBOutlet weak var newstxt: UITextField!
}


