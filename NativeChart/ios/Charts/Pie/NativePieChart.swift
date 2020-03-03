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
        self.setupChart()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData() {
        let formattedData = self.chartData.enumerated().map({i, element in PieChartDataEntry(value: element, label: dataLabels[i])})
        
        // Get data set
        let chartDataSet = PieChartDataSet(entries: formattedData, label: "")
        chartDataSet.colors = generateRandomColours(count: chartData.count)
        chartDataSet.drawIconsEnabled = false
        let chartData = PieChartData(dataSets: [chartDataSet])
        
        // No fraction
        let format = NumberFormatter()
        format.minimumFractionDigits = 0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: format))
        
        // Update data source
        self.data = chartData
        
        // Update theme colour
        let textColour = darkMode ? UIColor.white : UIColor.black
        self.legend.textColor = textColour
    }
    
    func generateRandomColours(count: Int) -> [UIColor] {
        // Generate random colours
        return Array(repeating: 0, count: count).map({i in
            // Dark colours only
            let r = CGFloat.random(in: 0...255) / 255.0
            let g = CGFloat.random(in: 0...255) / 255.0
            let b = CGFloat.random(in: 0...255) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: 1.0)
        });
    }
    
    func setupChart() {
        self.noDataText = "..."
        self.chartDescription?.text = ""
        self.drawEntryLabelsEnabled = false
        self.drawSlicesUnderHoleEnabled = false
        
        // Disable rotatition
        self.rotationEnabled = false
        self.rotationWithTwoFingers = false;
        // Transparent
        self.holeColor = UIColor(white: 1, alpha: 0)
    }
}
