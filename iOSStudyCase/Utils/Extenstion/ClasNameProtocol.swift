//
//  ClasNameProtocol.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension NSObject: ClassNameProtocol {}

public extension ClassNameProtocol {
    static var className: String {
        String(describing: self)
    }
    
    var className: String {
        Self.className
    }
}
