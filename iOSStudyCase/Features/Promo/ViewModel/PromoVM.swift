//
//  PromoVM.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

class PromoVM {
    
    func onLoadPromo(
        onLoad: @escaping () -> Void,
        onSuccess: @escaping ([Promo]) -> Void,
        onError: @escaping(String) -> Void
    ) {
        PromoService.shared.getListPromo {
            onLoad()
        } onSuccess: { promos in
            onSuccess(promos)
        } onError: { error in
            onError(error)
        }

    }
    
}
