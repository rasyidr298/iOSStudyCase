//
//  PromoCell.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 02/02/24.
//

import UIKit

class PromoCell: UITableViewCell {

    @IBOutlet weak var titlePromo: UILabel!
    @IBOutlet weak var imagePromo: UIImageView!
    
    private var promo: Promo? = nil
    var didClickItem: ((Promo) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickItem))
        contentView.addGestureRecognizer(tap)
    }
    
    func configure(
        _ value: Promo
    ) {
        self.promo = value
        titlePromo.text = value.name
        imagePromo.setImageUrl(urlPath: value.images_url ?? "")
    }
    
    @objc private func onClickItem() {
        didClickItem?(promo!)
    }
    
}
