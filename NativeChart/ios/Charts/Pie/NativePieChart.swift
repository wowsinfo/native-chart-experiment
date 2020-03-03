//
//  NativePieChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativePieChart : PieChartView {
    @objc var chartData: [Double] = []
    @objc var dataLabels: [String] = []
    @objc var darkMode: Bool = false
    @objc var themeColor: String = "#FFFFFF"
    
    override func didSetProps(_ changedProps: [String]!) {
        super.didSetProps(changedProps)
        self.updateData()
    }
    
    init() {
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData() {
        let formattedData = self.chartData.enumerated().map({i, element in PieChartDataEntry(value: Double(i), label: "")})
        
        // Get data set
        let chartDataSet = PieChartDataSet(entries: formattedData, label: "")
        chartDataSet.colors = ChartColorTemplates.material()
        chartDataSet.valueFont = UIFont.systemFont(ofSize: 12)
        let chartData = PieChartData(dataSets: [chartDataSet])
        
        // No fraction
        let format = NumberFormatter()
        format.minimumFractionDigits = 0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: format))
        
        // Update data source
        self.data = chartData
    }
    
    func setup() {
        self.noDataText = "..."
        self.chartDescription?.text = ""
        self.drawEntryLabelsEnabled = false
    }
}
