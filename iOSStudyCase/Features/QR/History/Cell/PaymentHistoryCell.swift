//
//  PaymentHistoryCell.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class PaymentHistoryCell: UITableViewCell {

    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ value: PaymentModel) {
        merchantLabel.text = value.merchantName
        saldoLabel.text = value.saldoAmount.toRupiah()
        priceLabel.text = value.saldoAmount.toRupiah()
    }
    
}
