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
   
  func isEmail() -> Bool
  {
    if self.isStringEmpty()
    {
      return false
    }
 
    let emailRegex = "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)" as String
    let emailText = NSPredicate(format: "SELF MATCHES %@",emailRegex)
    let isValid  = emailText.evaluate(with: self) as Bool
    return isValid
  }
 
  func isValidString() -> Bool
  {
    if self == "<null>" || self == "(null)"
    {
      return false
    }
    return true
  }
 
  func isURL() -> Bool
  {
    let urlRegex = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+" as String
    let urlText = NSPredicate(format: "SELF MATCHES %@", urlRegex)
    let isValid = urlText.evaluate(with: self) as Bool
    return isValid
  }
  
  // To Check Whether Image URL is valid
  func isImageURL() -> Bool
  {
    if self.isURL()
    {
      if self.range(of: ".png") != nil || self.range(of: ".jpg") != nil || self.range(of: ".jpeg") != nil
      {
        return true
      }
      else
      {
        return false
      }
    }
    else
    {
      return false
    }
  }
  
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
  
  static func getLength(_ message: Any?) -> Int
  {
    return String.getString(message).stringByTrimmingWhiteSpaceAndNewLine().count
  }
  
  static func checkForValidNumericString(_ message: AnyObject?) -> Bool
  {
    guard let strMessage = message as? String else
    {
      return true
    }
    
    if strMessage == "" || strMessage == "0"
    {
      return true
    }
    
    return false
  }
  
  
  // To Check Whether String is empty
  func isStringEmpty() -> Bool
  {
    return self.stringByTrimmingWhiteSpace().count == 0 ? true : false
  }
  
  mutating func removeSubString(subString: String) -> String
  {
    if self.contains(subString)
    {
      guard let stringRange = self.range(of: subString) else { return self }
      return self.replacingCharacters(in: stringRange, with: "")
    }
    return self
  }
  
  /*
   // To check whether String contains Only Letters
   func stringContainsOnlyLetters() -> Bool
   {
   let characterSet = NSCharacterSet.letterCharacterSet()
   return self.rangeOfCharacterFromSet(characterSet) != nil ? true : false
   }
   
   // To check whether String contains Only Numbers
   func stringContainsOnlyNumbers() -> Bool
   {
   let characterSet = NSCharacterSet.decimalDigitCharacterSet()
   return self.rangeOfCharacterFromSet(characterSet) != nil ? true : false
   }
   */
  
  // Get string by removing White Space & New Line
  func stringByTrimmingWhiteSpaceAndNewLine() -> String
  {
    return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
  }
  
  // Get string by removing White Space
  func stringByTrimmingWhiteSpace() -> String
  {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
  }
  
  func getSubStringFrom(begin: NSInteger, to end: NSInteger) -> String
  {
    return ""
  }
  
}
