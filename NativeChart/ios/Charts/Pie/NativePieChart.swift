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
        chartDataSet.colors = bestChartColours(count: chartData.count)
        chartDataSet.valueTextColor = UIColor.black
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
    
    /** It generates random coliour s or uses preset colours */
    func bestChartColours(count: Int) -> [UIColor] {
        var bestColours: [UIColor] = []

        if count <= 4 {
            bestColours += ChartColorTemplates.material()
        }

        if count <= 9 {
            bestColours += ChartColorTemplates.joyful()
        }
            
        if count <= 14 {
            bestColours += ChartColorTemplates.liberty()
        }
            
        if count <= 19 {
            bestColours += ChartColorTemplates.pastel()
        }
            
        if count <= 24 {
            bestColours += ChartColorTemplates.vordiplom()
        }
        
        if count > 24 {
            // Generate random colours if there are too many entries
            bestColours += Array(repeating: 0, count: count).map({i in
                // Dark colours only
                let r = CGFloat.random(in: 0...255) / 255.0
                let g = CGFloat.random(in: 0...255) / 255.0
                let b = CGFloat.random(in: 0...255) / 255.0
                return UIColor(red: r, green: g, blue: b, alpha: 1.0)
            });
        }
        
        return bestColours
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
