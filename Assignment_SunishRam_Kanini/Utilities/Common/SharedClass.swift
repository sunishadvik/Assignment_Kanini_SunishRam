//
//  SharedClass.swift
//  HealthTotal
//
//  Created by Office on 23/05/16.
//  Copyright © 2016 Collabroo. All rights reserved.
//

import UIKit
 



class SharedClass: NSObject
{
  static let sharedInstance = SharedClass()
  
  let gradientLayer    = CAGradientLayer()

  private override init()
  {
  }
 
  func getDictionary(_ dictData: Any?) -> Dictionary<String, Any>
  {
    guard let dict = dictData as? Dictionary<String, Any> else
    {
      guard let arr = dictData as? [Any] else
      {
        return ["":""]
      }
      return getDictionary(arr.count > 0 ? arr[0] : ["":""])
    }
    return dict
  }
    
    func getCurrentDate()-> Date {
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.hour = Calendar.current.component(.hour, from: now)
        nowComponents.minute = Calendar.current.component(.minute, from: now)
        nowComponents.second = Calendar.current.component(.second, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        return now as Date
    }
 
    func getUTCTime() -> String
    {
        let today = Date()
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         let result = formatter.string(from: today)
         let currentDate = formatter.date(from:result)!
        let globalTime = currentDate.timeIntervalSince1970
         let globelLocatime = String.getString(globalTime).components(separatedBy: ".")
        return globelLocatime[0]
    }
  
    func converDate(withStringDate stringDate : String , dateFormate : String) -> String
    {
         
           let isoDate = stringDate + "T10:44:00+0000"
        
           let dateFormatter = DateFormatter()
           dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
          // dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           let date = dateFormatter.date(from:isoDate)!
           dateFormatter.dateFormat = dateFormate
           let dateStr = String.getString(dateFormatter.string(from: date))
          return  dateStr
    }
  
    func convertDateIntoString(withDoubleDate dateDbl : Double, dateFormate : String)  -> String
    {
        let creation_date        = Double.getDouble(dateDbl)
        let date                 = Date(timeIntervalSince1970: creation_date)
        let dateFormatter        = DateFormatter()
        dateFormatter.timeStyle  = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle  = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = dateFormate //"dd-MM-yyyy"//' 'HH:mm:ss
        dateFormatter.timeZone   = .autoupdatingCurrent
        let localDate       = dateFormatter.string(from: date)
        let resultDate = String.getString(localDate)
        return resultDate
    }
     
     
    
}

