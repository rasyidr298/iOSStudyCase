//
//  PaymentHistoryCell.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class PaymentHistoryCell: UITableViewCell {

    @IBOutlet weak var amountSaldoLabel: UILabel!
    @IBOutlet weak var beginSaldo: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ value: PaymentModel) {
        merchantLabel.text = "Nama Merchant : " + value.merchantName
        amountSaldoLabel.text = "Sisa Saldo : " + value.saldoAmount.toRupiah()
        beginSaldo.text = "Saldo Awal : \((value.saldoAmount + (Int(value.transactionAmount) ?? 0)).toRupiah())"
        priceLabel.text = "Total Harga : \(Int(value.transactionAmount)?.toRupiah() ?? "")"
    }
    
}
