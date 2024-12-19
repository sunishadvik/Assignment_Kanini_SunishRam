//
//  SharedClass.swift
//  HealthTotal
//
//  Created by Office on 23/05/16.
//  Copyright © 2016 Collabroo. All rights reserved.
//

import UIKit

class SharedClass: NSObject {
  static let sharedInstance = SharedClass()
  let gradientLayer    = CAGradientLayer()
  private override init()
  {
  }
   func getDictionary(_ dictData: Any?) -> Dictionary<String, Any>
  {
      guard let dict = dictData as? Dictionary<String, Any> else {
       guard let arr = dictData as? [Any] else
       {
         return ["":""]
       }
       return getDictionary(arr.count > 0 ? arr[0] : ["":""])
      }
    return dict
  }
}

