//
//  UIViewBorderWidthAndColor.swift
//  TheBeaconApp
//
//
//  Created by Sunish Ram on 09/04/21.
//

import UIKit

class UIViewBorderWidthAndColor: UIView
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
