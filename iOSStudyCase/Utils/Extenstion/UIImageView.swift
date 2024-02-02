//
//  UIImageView.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 02/02/24.
//

import Foundation
import Kingfisher

public extension UIImageView {
    func setImageUrl(urlPath: String){
        if let url = URL(string: urlPath) {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: UIImage(named: "img_error.png")
            )
        }
    }
}
