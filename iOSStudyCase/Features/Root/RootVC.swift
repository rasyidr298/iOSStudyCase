//
//  ViewController.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class RootVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(
                for: QRVC(),
                title: "QR",
                image: UIImage(systemName: "qrcode")!,
                selectedImage: UIImage(systemName: "qrcode")!
            ),
            createNavController(
                for: PortofolioVC(),
                title: "Portofolio",
                image: UIImage(systemName: "tray.fill")!,
                selectedImage: UIImage(systemName: "tray.fill")!
            ),
            createNavController(
                for: PromoVC(),
                title: "Promo",
                image: UIImage(systemName: "doc.text")!,
                selectedImage: UIImage(systemName: "doc.text")!
            ),
        ]
    }
    
    private func createNavController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage, 
        selectedImage: UIImage
    ) -> UIViewController {
        let navVC = BaseNavigationController(rootViewController: rootViewController)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        navVC.tabBarItem.selectedImage = selectedImage
        return navVC
    }
}

