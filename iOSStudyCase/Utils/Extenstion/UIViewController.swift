//
//  UIViewController.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

extension UIViewController {
    
    func pushController(_ viewController: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func modallyController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.navigationController?.present(viewController, animated: animated, completion: completion)
    }
    
    func popController(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
    
}
