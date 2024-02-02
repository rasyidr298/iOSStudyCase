//
//  PromoModel.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 02/02/24.
//

import Foundation

struct PromoResponse: Decodable {
    let promos: [Promo]
}

struct Promo: Decodable {
    let id: Int?
    let name: String?
    let images_url: String?
    let detail: String?
}
