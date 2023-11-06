//
//  QRVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit
import SwiftQRScanner

class QRVC: UIViewController {

    private var saldoAwal: Int = 500000
    private lazy var vm: PaymentVM = PaymentVM()
    @IBOutlet weak var saldoLabel: UILabel!
    
    var qrModel: QRModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "QR"
        setupView()
    }

    @IBAction func onCLickHistory(_ sender: Any) {
        let vc = PaymentHistoryVC()
        pushController(vc, animated: true)
    }
    
    @IBAction func onCLickScanQR(_ sender: Any) {
        let scanner = QRCodeScannerController()
        scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }
    
    private func setupView() {
        saldoLabel.text = saldoAwal.toRupiah()
    }
    
}

extension QRVC: QRScannerCodeDelegate {
    func qrScannerDidFail(_ controller: UIViewController, error: QRCodeError) {
        print("error:\(error.localizedDescription)")
    }
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        let vc =  PaymentVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        controller.dismiss(animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let qrModel = QRModel(qrString: result) {
                
                let vc =  PaymentVC()
                vc.qrModel = qrModel
                
                vc.didClickPay = {[weak self] qrModel in
                    self?.dismiss(animated: true)
                    self?.setupView()
                    self?.saldoAwal -= Int(qrModel.transactionAmount) ?? 0
                    self?.vm.onSavePayment(qrModel.toPaymentModel(saldoAmount: self?.saldoAwal ?? 0))
                }
                
                vc.didClickCancel = {[weak self] in
                    self?.dismiss(animated: true)
                }
                
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .coverVertical
                self.present(vc, animated: true)
            }
        }
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("SwiftQRScanner did cancel")
    }
}
