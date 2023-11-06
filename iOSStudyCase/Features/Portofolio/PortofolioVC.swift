//
//  PortofolioVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit
import Charts

class PortofolioVC: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var donutChartView: PieChartView!
    
    private lazy var vm: PortofolioVM = PortofolioVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Portofolio"
    }


}
