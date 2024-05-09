//
//  Speciallabel.swift
//  I-NEWS
//
//  Created by Prexa Patel on 06/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit
@IBDesignable
class Speciallabel: UILabel {

    @IBInspectable var borderColor : UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
            
            //self.layer.borderColor = myColor.cgColor
            
            self.layer.borderWidth = 2.0
            
            
        }
  
    }
    @IBInspectable var cornerradius : CGFloat = 0{
        didSet{
            
            layer.cornerRadius = cornerradius
            layer.cornerRadius = 10
            
        }
        
    }
//    @IBInspectable var height : CGFloat = 0{
//        didSet{
//        height = 35
//
//        }
//    }
}
