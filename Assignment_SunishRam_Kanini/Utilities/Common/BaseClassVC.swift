//
//  BaseClassVC.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import UIKit

class BaseClassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    
    func configureSplitViewController<T: UIViewController, U: UIViewController>(
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
        
        // Configure Master ViewController
        if let masterVC = (splitVC.viewControllers.first as? UINavigationController)?.topViewController as? T {
            configureMaster?(masterVC)
        }
        
        // Configure Detail ViewController
        if let detailVC = (splitVC.viewControllers.last as? UINavigationController)?.topViewController as? U {
            configureDetail?(detailVC)
        }
        
        // Present SplitViewController
        splitVC.modalPresentationStyle = presentationStyle
        present(splitVC, animated: true)
    }
    
    func presentSplitViewController<T: UISplitViewController>(
        storyboardName: String,
        splitVCIdentifier: String,
        splitVCType: T.Type,
        presentationStyle: UIModalPresentationStyle = .fullScreen
    ) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        guard let splitVC = storyboard.instantiateViewController(withIdentifier: splitVCIdentifier) as? T else {
            print("Error: Could not instantiate \(splitVCIdentifier) as \(T.self)")
            return
        }
        
        splitVC.modalPresentationStyle = presentationStyle
        present(splitVC, animated: true)
    }

}
