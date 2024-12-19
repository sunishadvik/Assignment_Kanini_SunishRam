//
//  Common.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import Foundation
import UIKit
 
struct Constant
{
    static let kSharedInstance    = SharedClass.sharedInstance
    static let kScreenWidth       = UIScreen.main.bounds.size.width
    static let kScreenHeight      = UIScreen.main.bounds.size.height
    static let genderTypes        = ["Male","Female","Other"]
}
struct CommonStringValue
{
    static let main   = "Main"
    static let year   = " yr"
    static let appName = "Assignment"
}

extension UIViewController
{
    static func showOkAlert(on viewController: UIViewController, title: String , message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
   static func configureSplitViewController<T: UIViewController, U: UIViewController>( on viewController: UIViewController,
        storyboardName: String,
        splitVCIdentifier: String,
        masterType: T.Type,
        detailType: U.Type,
        configureMaster: ((T) -> Void)?,
        configureDetail: ((U) -> Void)?,
        presentationStyle: UIModalPresentationStyle = .fullScreen
    ) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let splitVC = storyboard.instantiateViewController(withIdentifier: splitVCIdentifier) as? UISplitViewController else {
            return
        }
        if let masterVC = (splitVC.viewControllers.first as? UINavigationController)?.topViewController as? T {
            configureMaster?(masterVC)
        }
        if let detailVC = (splitVC.viewControllers.last as? UINavigationController)?.topViewController as? U {
            configureDetail?(detailVC)
        }
        splitVC.modalPresentationStyle = presentationStyle
        viewController.present(splitVC, animated: true)
    }
    func presentSplitViewController<T: UISplitViewController>(on viewController: UIViewController,
        storyboardName: String,
        splitVCIdentifier: String,
        splitVCType: T.Type,
        presentationStyle: UIModalPresentationStyle = .fullScreen
    ){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        guard let splitVC = storyboard.instantiateViewController(withIdentifier: splitVCIdentifier) as? T else {
            print("Error: Could not instantiate \(splitVCIdentifier) as \(T.self)")
            return
        }
        splitVC.modalPresentationStyle = presentationStyle
        viewController.present(splitVC, animated: true)
    }
}
 
