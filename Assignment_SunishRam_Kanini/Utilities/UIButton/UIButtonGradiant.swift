//
//  UIButtonGradiant.swift
//  Abwab
//
//  Created by Sunish Ram on 15/01/21.
//

import UIKit
@IBDesignable
class UIButtonGradiant: UIButton {
    
    @IBInspectable var firstColor:UIColor = UIColor.clear {
        didSet{
            updateVC()
        }
    }
    @IBInspectable var secondColor:UIColor = UIColor.clear {
        didSet{
            updateVC()
        }
    }
    
    override func layoutSubviews() {
       // updateVC()
    }
     func updateVC() {
        
        let layer = CAGradientLayer()
        layer.colors = [UIColor.init(red: 252/255, green: 184/255, blue: 37/255, alpha: 1).cgColor,UIColor.init(red: 251/255, green: 146/255, blue: 51/255, alpha: 1).cgColor]
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at: 0)
    }
}
