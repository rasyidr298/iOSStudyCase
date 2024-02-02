//
//  PromoService.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 02/02/24.
//

import Foundation
import Alamofire

class PromoService {
    
    public static let shared = PromoService()
    
    //MARK: get list promo
    func getListPromo(
        onLoad: @escaping () -> Void,
        onSuccess: @escaping ([Promo]) -> Void,
        onError: @escaping(String) -> Void
    ) {
        let url = "http://demo5853970.mockable.io/promos"
        
        let header: HTTPHeaders = [
            "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8"
        ]
        
        onLoad()
        AF.request(
            url,
            method: .get,
            headers: header,
            requestModifier: { $0.timeoutInterval = 5 }
        )
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let resultData):
                if let result = try? JSONDecoder().decode(PromoResponse.self, from: resultData) {
                    onSuccess(result.promos)
                }
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
        
    }
}
