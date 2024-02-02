//
//  PortofolioVM.swift
//  iOSStudyCase
//
//  Created by Rasyid Ridla on 06/11/23.
//

import Foundation
import DGCharts

class PortofolioVM {
    
    
    func onLoadPiehartData() -> PieChartData {
        var chartData: [PieChartDataEntry] = []
        chartData.append(
            PieChartDataEntry(
                value: 55,
                label: "Tarik Tunai",
                data: "21/01/2023 = 1000000 | 20/01/2023 = 500000 | 19/01/2023 = 1000000"
            )
        )
        chartData.append(
            PieChartDataEntry(
                value: 7.7,
                label: "Topup Gopay",
                data: "21/01/2023 = 2000000 | 20/01/2023 = 900000 | 19/01/2023 = 9000000"
            )
        )
        chartData.append(
            PieChartDataEntry(
                value: 6.3,
                label: "Lainnya",
                data: "21/01/2023 = 1000000 | 20/01/2023 = 500000 | 19/01/2023 = 1000000"
            )
        )
        
        let set = PieChartDataSet(entries: chartData, label: "Donut Chart")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        set.colors = ChartColorTemplates.vordiplom()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.colorful()
        + ChartColorTemplates.liberty()
        + ChartColorTemplates.pastel()
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .heavy))
        data.setValueTextColor(.black)
        
        return data
    }
    
    func onLoadLineChartData() -> LineChartData{
        
        var dataEntry: [ChartDataEntry] = []
        
        dataEntry.append(ChartDataEntry(x: 1, y: 3, data: "Januari"))
        dataEntry.append(ChartDataEntry(x: 2, y: 7, data: "Februari"))
        dataEntry.append(ChartDataEntry(x: 3, y: 8, data: "Maret"))
        dataEntry.append(ChartDataEntry(x: 4, y: 10, data: "April"))
        dataEntry.append(ChartDataEntry(x: 5, y: 5, data: "Mei"))
        dataEntry.append(ChartDataEntry(x: 6, y: 10, data: "Juni"))
        
        dataEntry.append(ChartDataEntry(x: 7, y: 1, data: "Juli"))
        dataEntry.append(ChartDataEntry(x: 8, y: 2, data: "Agustus"))
        dataEntry.append(ChartDataEntry(x: 9, y: 5, data: "September"))
        dataEntry.append(ChartDataEntry(x: 10, y: 10, data: "Oktober"))
        dataEntry.append(ChartDataEntry(x: 11, y: 7, data: "November"))
        dataEntry.append(ChartDataEntry(x: 12, y: 7, data: "Desember"))
        
        let set1 = LineChartDataSet(entries: dataEntry, label: "lineChart")
        let data = LineChartData(dataSet: set1)
        
        return data
    }
    
    
}
