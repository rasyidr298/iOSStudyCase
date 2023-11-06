//
//  ViewController.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickQR(_ sender: Any) {
        let vc = QRVC()
        pushController(vc, animated: true)
    }
    
    @IBAction func onClickPromo(_ sender: Any) {
        let vc = PromoVC()
        pushController(vc, animated: true)
    }
    
    @IBAction func onClickPortofolio(_ sender: Any) {
//        let vc = PortofolioVC()
//        pushController(vc, animated: true)
        
        
        let vc =  PaymentVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.qrModel = QRModel(qrString: "BNI.ID12345678.MERCHANT MOCK TEST.50000")
        self.present(vc, animated: true)
    }
    
    @IBAction func onClickPushNotif(_ sender: Any) {
        let vc = PushNotif()
        pushController(vc, animated: true)
    }
}

