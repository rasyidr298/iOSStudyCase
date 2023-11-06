//
//  PaymentHistoryVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit

class PaymentHistoryVC: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    private var dataSource: [PaymentModel] = []
    private lazy var vm: PaymentVM = PaymentVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Payment History"
        
        setupVM()
        setUpTableView()
    }
    
    private func setupVM() {
        vm.onLoadPayment { [weak self] payments in
            self?.dataSource.append(contentsOf: payments)
        }
    }
    
    private func setUpTableView() {
        contentTableView.separatorStyle = .none
        contentTableView.register(cellWithClass: PaymentHistoryCell.self)
        contentTableView.dataSource = self
    }

}

extension PaymentHistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PaymentHistoryCell.self, for: indexPath)
        let payment = dataSource[indexPath.row]
        
        cell.configure(payment)
        
        return cell
    }
}
