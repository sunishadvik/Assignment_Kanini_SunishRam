//
//  UIButtonCornerRadius.swift
//  OneClickWash
//
//  Created by Sunish Ram on 15/01/21.
//

import UIKit

class UIButtonCornerRadius: UIButton
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
