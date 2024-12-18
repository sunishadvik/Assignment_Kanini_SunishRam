//
//  UIButtonBorderWidthAndColor.swift
//  OneClickWash
//
//  Created by Sunish Ram on 15/01/21.
//

import UIKit

class UIButtonBorderWidthAndColor: UIButtonCornerRadius
{
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
}
