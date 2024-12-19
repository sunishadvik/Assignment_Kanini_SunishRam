//
//  String+Utilities.swift
//  HealthTotal
//
//  Created by Sunish Ram on 17/09/21.
//

import Foundation
import UIKit
extension String
{
  static func getString(_ message: Any?) -> String
  {
    guard let strMessage = message as? String else
    {
      guard let doubleValue = message as? Double else
      {
        guard let intValue = message as? Int else
        {
          guard let int64Value = message as? Int64 else
          {
            return ""
          }
          return String(int64Value)
        }
        return String(intValue)
      }
      let formatter = NumberFormatter()
      formatter.minimumFractionDigits = 0
      formatter.maximumFractionDigits = 2
      formatter.minimumIntegerDigits = 1
      guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else
      {
        return ""
      }
      return formattedNumber
    }
    return strMessage.stringByTrimmingWhiteSpaceAndNewLine()
  }
  func stringByTrimmingWhiteSpaceAndNewLine() -> String
  {
    return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
  }
}
