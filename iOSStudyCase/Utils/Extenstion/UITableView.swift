//
//  UITableView.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(cellWithClass name: T.Type, bundle: Bundle? = nil) {
        let className = name.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
}
