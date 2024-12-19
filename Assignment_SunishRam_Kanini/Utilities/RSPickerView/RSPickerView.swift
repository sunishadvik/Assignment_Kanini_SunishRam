//
//  RSPickerView.swift
//  Evango
//
//  Created by Sunish Ram on 13/07/20.
//

import UIKit

 
let pickerTopMargin: CGFloat = 0

@available(iOS 14.0, *)
class RSPickerView: UIView
{
  private var callBack = {(index: Int, response: Any?) -> () in
  }
  var arrData: [Any]!
  var strKey: String?
  var pickerView: UIPickerView!
  var viewContainer: UIView!
  convenience init(view: UIView, arrayList list: [Any], keyValue key: String?, handler completionBlock: @escaping (_ index: Int, _ response: Any?) -> ())
  {
    let rect = view.bounds
    self.init(frame: rect)
    arrData = list
    strKey = key
    let viewHt = rect.size.height
    let cHt = 261
    let yValue = viewHt - CGFloat(cHt) - pickerTopMargin
    viewContainer = UIView(frame: CGRect(x: 0, y: viewHt, width: Constant.kScreenWidth, height: CGFloat(cHt)))
    pickerView = UIPickerView(frame: CGRect(x: 2, y: 35, width: Constant.kScreenWidth, height: 162))
    pickerView.delegate = self
    pickerView.dataSource = self
    pickerView.reloadAllComponents()
    viewContainer.addSubview(pickerView)
    let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: Constant.kScreenWidth, height: 35))
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
        if self.arrData.count > 0
        {
          if self.strKey == nil
          {
            self.callBack(self.pickerView.selectedRow(inComponent: 0), String.getString(self.arrData[self.pickerView.selectedRow(inComponent: 0)]).capitalized)
          }
          else
          {
              self.callBack(self.pickerView.selectedRow(inComponent: 0), String.getString(Constant.kSharedInstance.getDictionary(self.arrData[self.pickerView.selectedRow(inComponent: 0)])[self.strKey!]).capitalized)
          }
        }
        else
        {
          self.callBack(-1, nil)
        }
        self.removeFromSuperview()
      }
    }
  }
}
extension RSPickerView : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
      return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
      return arrData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
      if strKey == nil
      {
        return String.getString(arrData[row])
      }
      else
      {
          let dictData = Constant.kSharedInstance.getDictionary(arrData[row])
        return String.getString(dictData[strKey!])
      }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
    }
}
