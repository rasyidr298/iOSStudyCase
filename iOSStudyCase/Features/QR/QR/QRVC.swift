//
//  QRVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit
import SwiftQRScanner

class QRVC: UIViewController {

    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var historyTableView: UITableView!
    
    private var saldoAmount: Int = .zero
    private var dataSource: [PaymentModel] = []
    private var qrModel: QRModel? = nil
    
    private lazy var vm: PaymentVM = PaymentVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Payment QR"
        
        setUpTableView()
        onLoadSaldo()
        onLoadHistory()
    }
    
    @IBAction func onCLickScanQR(_ sender: Any) {
        let scanner = QRCodeScannerController()
        scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }
    
    private func setUpTableView() {
        historyTableView.separatorStyle = .none
        historyTableView.register(cellWithClass: PaymentHistoryCell.self)
        historyTableView.dataSource = self
    }
    
    private func onLoadHistory() {
        vm.onLoadPayment { [weak self] payments in
            self?.dataSource = payments
            self?.historyTableView.reloadData()
        }
    }
    
    private func onLoadSaldo() {
        vm.onLoadSaldo { [weak self] saldo in
            if saldo == nil || saldo == 0 {
                self?.vm.onSaveSaldoAmount(900000)
                self?.onUpdateSaldo(900000)
            }else {
                self?.onUpdateSaldo(saldo ?? 0)
            }
        }
    }
    
    private func onUpdateSaldo(
        _ value: Int
    ) {
        self.saldoLabel.text = value.toRupiah()
        self.saldoAmount = value
    }
    
}

//MARK: QRCode
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
                    self?.saldoAmount -= Int(qrModel.transactionAmount) ?? 0
                    self?.vm.onSavePayment(qrModel.toPaymentModel(saldoAmount: self?.saldoAmount ?? 0))
                    self?.vm.onSaveSaldoAmount(self?.saldoAmount ?? 0)
                    self?.onLoadSaldo()
                    self?.onLoadHistory()
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


//MARK: TableView
extension QRVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: PaymentHistoryCell.self, for: indexPath)
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        let borderColor: UIColor = .systemBlue
        cell.layer.borderColor = borderColor.cgColor
        
        let payment = dataSource[indexPath.row]
        
        cell.configure(payment)
        
        return cell
    }
}
