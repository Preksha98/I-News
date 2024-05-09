//
//  Specialfield.swift
//  I-NEWS
//
//  Created by Prexa Patel on 26/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit
@IBDesignable
class Specialfield: UITextField {

    @IBInspectable var borderColor : UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
            
            //self.layer.borderColor = myColor.cgColor
            
            self.layer.borderWidth = 2.0
            
            
        }
        
    }
    @IBInspectable var height : CGFloat = 0{
        didSet{
            
            height = 100
            
            
            
            
        }
    }
    
    
    @IBInspectable var cornerradius : CGFloat = 0{
        didSet{
            
            layer.cornerRadius = cornerradius
            layer.cornerRadius = 10
            
            }
        
    }
  
    
    
}
