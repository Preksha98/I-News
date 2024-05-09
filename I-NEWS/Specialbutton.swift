//
//  Specialbutton.swift
//  I-NEWS
//
//  Created by Prexa Patel on 06/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit
@IBDesignable
class Specialbutton: UIButton {

    @IBInspectable var borderColor : UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
            
            //self.layer.borderColor = myColor.cgColor
            
            self.layer.borderWidth = 3.0
            
            
            
        }
        
    }
    @IBInspectable var cornerradius : CGFloat = 0{
        didSet{
            
            layer.cornerRadius = cornerradius
            layer.cornerRadius = 10.0
            
            
        }
        
    }
}
