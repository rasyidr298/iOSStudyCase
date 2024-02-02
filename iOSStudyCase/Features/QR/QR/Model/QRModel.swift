//
//  QRModel.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

struct QRModel: Codable  {
    let bankSource: String
    let transactionID: String
    let merchantName: String
    let transactionAmount: String
    
    init?(qrString: String) {
        let components = qrString.components(separatedBy: ".")
        
        guard components.count == 4 else {
            return nil // QR string format tidak sesuai
        }
        
        self.bankSource = components[0]
        self.transactionID = components[1]
        self.merchantName = components[2]
        self.transactionAmount = components[3]
    }
}

extension QRModel {
    func toPaymentModel(
        saldoAmount: Int
    ) -> PaymentModel {
        PaymentModel(
            bankSource: self.bankSource,
            transactionID: self.transactionID,
            merchantName: self.merchantName,
            transactionAmount: self.transactionAmount,
            saldoAmount: saldoAmount
        )
    }
}
