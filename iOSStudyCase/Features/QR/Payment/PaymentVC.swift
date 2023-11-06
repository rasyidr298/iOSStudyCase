//
//  PaymentConfirmVM.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class PaymentVC: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var idTransactionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var merchantNameLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var qrModel: QRModel? = nil
    var didClickCancel: (() -> Void)?
    var didClickPay: ((QRModel) -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 10
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        merchantNameLabel.text = qrModel?.merchantName
        idTransactionLabel.text = qrModel?.transactionID
        priceLabel.text = Int(qrModel?.transactionAmount ?? "")?.toRupiah()
    }
    
    @IBAction func onClickCancel(_ sender: Any) {
        didClickCancel?()
    }
    
    @IBAction func onClickPay(_ sender: Any) {
        if let qrModel = qrModel {
            didClickPay?(qrModel)
        }
    }
    
}
