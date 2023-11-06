//
//  Int.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

extension Int {
    func toRupiah() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "id_ID")
        
        if let rupiahString = numberFormatter.string(from: NSNumber(value: self)) {
            return rupiahString
        } else {
            return "Invalid amount"
        }
    }
}
