//
//  BaseNavigationController.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 02/02/24.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            appearance.backgroundImage = nil
            appearance.shadowImage = nil
            navigationBar.standardAppearance = appearance
            let proxy = UINavigationBar.appearance()
            proxy.tintColor = .white
            proxy.standardAppearance = appearance
            proxy.scrollEdgeAppearance = appearance
        } else {
            self.navigationBar.isTranslucent = false
            self.navigationBar.barTintColor = .blue
            self.navigationBar.tintColor = .white
            self.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            self.navigationBar.setBackgroundImage(nil, for: .default)
            self.navigationBar.shadowImage = nil
        }
        
        self.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            self.topViewController?.navigationItem.backBarButtonItem =
            UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
}
