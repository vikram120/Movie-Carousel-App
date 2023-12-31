//
//  UIView+Extension.swift
//  GyreNetwork
//
//  Created by Vikram Kunwar on 02/09/23.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
        
        
        
        
    }
    
    @IBInspectable var shadow: CGFloat {
        get {return shadow}
        set{
            self.layer.cornerRadius = newValue
        }
        
        
        
        
    }
}

