//
//  RSDatePicker.swift
//  Evango
//
//  Created by Sunish Ram on 29/08/20.
 
//

import UIKit

 
let datePickerTopMargin: CGFloat = 0

@available(iOS 14.0, *)
class RSDatePicker: UIView
{
  private var callBack = {(response: Any?) -> () in
  }
  var pickerView: UIDatePicker!
  var viewContainer: UIView!
  convenience init(view: UIView, pickerMode mode: UIDatePicker.Mode, handler completionBlock: @escaping (_ response: Any?) -> ())
  {
    let rect = view.bounds
    self.init(frame: rect)
    let viewHt = rect.size.height
    let cHt = 301
    let yValue = viewHt - CGFloat(cHt) - pickerTopMargin
    viewContainer = UIView(frame: CGRect(x: 0, y: viewHt, width: Constant.kScreenWidth, height: CGFloat(cHt)))
    pickerView = UIDatePicker(frame: CGRect(x: 40, y: 35, width: Constant.kScreenWidth, height: 162))
      if #available(iOS 14.0, *) {
          pickerView.preferredDatePickerStyle = .wheels
      } else {
         
      }
    pickerView.date           = Date()
    pickerView.datePickerMode = mode
    viewContainer.addSubview(pickerView)
    let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width:Constant.kScreenWidth, height: 35))
    viewHeader.backgroundColor = .blue
    let btnCancel = getButton(xValue: 1.0, buttonTitle: "Cancel")
    viewHeader.addSubview(btnCancel)
    let btnDone = getButton(xValue: Constant.kScreenWidth - 71.0, buttonTitle: "Done")
    viewHeader.addSubview(btnDone)
    viewContainer.addSubview(viewHeader)
    self.addSubview(viewContainer)
    view.addSubview(self)
    callBack = completionBlock
    UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
      var frame = self.viewContainer.frame
      frame.origin.y = yValue
      self.viewContainer.frame = frame
      }, completion: nil)
  }
  override init(frame: CGRect)
  {
    super.init(frame: frame)
  }
  required init?(coder aDecoder: NSCoder)
  {
    fatalError("init(coder:) has not been implemented")
  }
  private func getButton(xValue: CGFloat, buttonTitle title: String) -> UIButton
  {
    let button = UIButton(type: .custom)
    button.frame = CGRect(x: xValue, y: 1, width: 70, height: 35)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
    if (title == "Cancel")
    {
      button.addTarget(self, action: #selector(tapCancel(sender:)), for: .touchUpInside)
    }
    else
    {
      button.addTarget(self, action: #selector(tapDone(sender:)), for: .touchUpInside)
    }
    return button
  }
  func setMinimumDate(date: Date)
  {
    pickerView.minimumDate = date
  }
  
  func setMaximumDate(date: Date)
  {
    pickerView.maximumDate = date
  }
  
  func setCurrentDate(date: Date)
  {
    pickerView.date = date
  }
    @objc func tapCancel(sender: UIButton)
  {
    UIView.animate(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
      var frame = self.viewContainer.frame
      frame.origin.y = self.frame.size.height
      self.viewContainer.frame = frame
    }) { (finished) in
      self.removeFromSuperview()
    }
  }
    @objc func tapDone(sender: UIButton)
   {
    UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
      var frame = self.viewContainer.frame
      frame.origin.y = self.frame.size.height
      self.viewContainer.frame = frame
      })
    { (finished) in
      if finished
      {
        self.callBack(self.pickerView?.date)
        self.removeFromSuperview()
      }
    }
  }
}
 
class DatePickerHelper {
    static func showDatePicker<T: UIView>(
        on view: T,
        pickerMode: UIDatePicker.Mode = .date,
        dateFormat: String = "dd-MM-yyyy",
        completion: @escaping (String, Int) -> Void // Add Int for age
    ) {
        let datePicker = RSDatePicker.init(view: view, pickerMode: pickerMode, handler: { (response: Any?) in
            guard let selectedDate = response as? Date else { return }
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            let formattedDate = formatter.string(from: selectedDate)
            let currentDate = Date()
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: selectedDate, to: currentDate)
            let age = ageComponents.year ?? 0
            completion(formattedDate, age)
        })
        let currentDate = Date()
        let calendar = Calendar.current
        let maxDate = calendar.date(byAdding: .year, value: -1, to: currentDate)
        if let maxDate = maxDate {
            datePicker.setMaximumDate(date: maxDate)
        }
        datePicker.viewContainer.backgroundColor = .white
    }

}
