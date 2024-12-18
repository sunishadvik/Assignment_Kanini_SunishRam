//
//  UIviewCornerRadius.swift
//  TheBeaconApp
//
//  Created by Sunish Ram on 09/04/21.
//

import UIKit

class UIviewCornerRadius: UIViewBorderWidthAndColor
{
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  @IBInspectable var makeCircle: Bool = false {
    didSet
    {
      layer.masksToBounds = cornerRadius > 0
    }
  }
}
