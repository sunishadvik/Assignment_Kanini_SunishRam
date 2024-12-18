//
//  UITableViewCellExtended.swift
//  TheBeaconApp
//
//   Created by Sunish Ram on 17/12/24.
//
//

import UIKit

extension UITableViewCell
{
  static func cellIdentifier() -> String
  {
    return String(describing: self)
  }
}
extension UITableView {
    func registerNib<T: UITableViewCell>(for type: T.Type) {
        let nibName = String(describing: type)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
    }
}
