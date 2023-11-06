//
//  PaymentModel.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

struct PaymentModel: Codable {
    let bankSource: String
    let transactionID: String
    let merchantName: String
    let transactionAmount: String
    let saldoAmount: Int
}
