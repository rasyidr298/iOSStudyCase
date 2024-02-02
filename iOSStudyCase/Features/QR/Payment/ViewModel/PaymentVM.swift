//
//  PaymentVM.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

class PaymentVM {
    
    //MARK: save payment
    func onSavePayment(
        _ value: PaymentModel
    ) {
        var lastPaymentData: [PaymentModel] = []
        
        lastPaymentData.append(value)

        onLoadPayment { payment in
            lastPaymentData.append(contentsOf: payment)
        }
        
        LocalHelper.shared.saveEncodable(lastPaymentData, forKey: PaymentCacheKey.paymentSuccess.rawValue)
    }
    
    //MARK: load payment
    func onLoadPayment(
        didLoadPayment: @escaping ([PaymentModel]) -> Void
    ) {
        let payment: [PaymentModel]? = LocalHelper.shared.loadDecodable(forKey: PaymentCacheKey.paymentSuccess.rawValue)
        
        if let payment {
            didLoadPayment(payment)
        }
    }
    
    //MARK: save saldo
    func onSaveSaldoAmount(
        _ value: Int
    ) {
        LocalHelper.shared.saveEncodable(value, forKey: PaymentCacheKey.saldoAmount.rawValue)
    }
    
    //MARK: load saldo
    func onLoadSaldo(
        didLoadSaldo: @escaping (Int?) -> Void
    ) {
        let saldo: Int? = LocalHelper.shared.loadDecodable(forKey: PaymentCacheKey.saldoAmount.rawValue)
        didLoadSaldo(saldo)
    }
}
