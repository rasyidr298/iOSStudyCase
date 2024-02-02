//
//  PortofolioVC.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import UIKit
import DGCharts
import SVProgressHUD

class PortofolioVC: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var donutChartView: PieChartView!
    
    private lazy var vm: PortofolioVM = PortofolioVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Portofolio"
        
        setupPieChart()
        setupPieChartData()
        
        setupLineChart()
        setupLineChartData()
    }
}

//MARK: Chart
extension PortofolioVC {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        SVProgressHUD.showInfo(withStatus: entry.data.debugDescription)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SVProgressHUD.dismiss()
        }
    }
}

//MARK: Donut Chart
extension PortofolioVC {
    
    private func setupPieChart() {
        donutChartView.delegate = self
        
        donutChartView.usePercentValuesEnabled = true
        donutChartView.drawSlicesUnderHoleEnabled = false
        donutChartView.holeRadiusPercent = 0.58
        donutChartView.transparentCircleRadiusPercent = 0.61
        donutChartView.chartDescription.enabled = false
        donutChartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        
        donutChartView.drawCenterTextEnabled = true
        
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        donutChartView.drawHoleEnabled = true
        donutChartView.rotationAngle = 0
        donutChartView.rotationEnabled = true
        donutChartView.highlightPerTapEnabled = true
        
        donutChartView.entryLabelColor = .white
        donutChartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        donutChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    private func setupPieChartData() {
        donutChartView.data = vm.onLoadPiehartData()
        donutChartView.highlightValues(nil)
    }
}

//MARK: Line Chart
extension PortofolioVC {
    private func setupLineChart() {
        lineChartView.chartDescription.enabled = false
        lineChartView.dragEnabled = true
        lineChartView.setScaleEnabled(true)
        lineChartView.pinchZoomEnabled = true
        
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.labelCount = 8
        lineChartView.xAxis.drawGridLinesEnabled = true
        lineChartView.xAxis.gridLineDashLengths = [10, 10]
        
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        
        lineChartView.legend.form = .line
        lineChartView.animate(xAxisDuration: 2.5)
    }
    
    private func setupLineChartData() {
        lineChartView.data = vm.onLoadLineChartData()
    }
}
