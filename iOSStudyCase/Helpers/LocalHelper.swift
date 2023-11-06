//
//  LocalHelper.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

class LocalHelper {
    static let shared = LocalHelper()
    private let userDefaults: UserDefaults = .standard
    
    func saveEncodable(_ value: Encodable, forKey key: String) {
        if let encodedData = try? JSONEncoder().encode(value) {
            userDefaults.set(encodedData, forKey: key)
        }
    }
    
    func loadDecodable<Element: Decodable>(forKey key: String) -> Element? {
        var result: Element?
        
        if let data = userDefaults.data(forKey: key),
           let decodedResult = try? JSONDecoder().decode(Element.self, from: data) {
            result = decodedResult
        }
        
        return result
    }
    
    func clear(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
