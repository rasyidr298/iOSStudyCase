//
//  PromoVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit
import SVProgressHUD

class PromoVC: UIViewController {
    
    @IBOutlet weak var promoTable: UITableView!
    private lazy var vm: PromoVM = PromoVM()
    private var dataSource: [Promo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Promo"

        setUpTableView()
        onLoadPromo()
    }
    
    private func setUpTableView() {
        promoTable.separatorStyle = .none
        promoTable.register(cellWithClass: PromoCell.self)
        promoTable.dataSource = self
    }
    
    private func onLoadPromo() {
        vm.onLoadPromo {
            SVProgressHUD.show(withStatus: "Loading...")
        } onSuccess: { [weak self] promos in
            self?.dataSource.append(contentsOf: promos)
            self?.promoTable.reloadData()
            SVProgressHUD.dismiss()
        } onError: { error in
            SVProgressHUD.showError(withStatus: error)
            SVProgressHUD.dismiss()
        }
    }
}

//MARK: TableView
extension PromoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PromoCell.self, for: indexPath)
        
        cell.didClickItem = {promo in
            if let url = URL(string: promo.detail ?? ""), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        
        let promo = dataSource[indexPath.row]
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        let borderColor: UIColor = .systemBlue
        cell.layer.borderColor = borderColor.cgColor
        
        cell.configure(promo)
        
        return cell
    }
}
