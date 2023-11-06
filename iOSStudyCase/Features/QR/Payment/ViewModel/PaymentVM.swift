//
//  PaymentVM.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

class PaymentVM {
    
    func onSavePayment(
        _ value: PaymentModel
    ) {
        var lastPaymentData: [PaymentModel] = []
        
        lastPaymentData.append(value)

        onLoadPayment { payment in
            lastPaymentData.append(contentsOf: payment)
        }
        
        LocalHelper.shared.saveEncodable(lastPaymentData, forKey: PaymentHistoryCacheKey.paymentSuccess.rawValue)
    }
    
    func onLoadPayment(
        didLoadPayment: @escaping ([PaymentModel]) -> Void
    ) {
        let payment: [PaymentModel]? = LocalHelper.shared.loadDecodable(forKey: PaymentHistoryCacheKey.paymentSuccess.rawValue)
        
        if let payment {
            didLoadPayment(payment)
        }
    }
}
