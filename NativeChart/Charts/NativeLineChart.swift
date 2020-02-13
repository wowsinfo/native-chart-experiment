//
//  NativeLineChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativeLineChart : LineChartView {
    
    @objc var chartData: [Double] = [] {
        didSet {
            
        }
    }
    
    @objc var legendLabel: String = ""
    @objc var darkMode: Bool = false
    @objc var themeColor: String = "#FFFFFF"
    
    override func didSetProps(_ changedProps: [String]!) {
        super.didSetProps(changedProps)
        self.updateChartData()
    }
    
    init() {
        super.init(frame: CGRect())
        setupLineChart()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateChartData() {
        // Remove all lines to prevent drawing multiple lines
        self.rightAxis.removeAllLimitLines()

        let formattedData = self.chartData.enumerated().map({ i, element in ChartDataEntry(x: Double(i), y: element)})
        
        let realThemeColour = UIColor(hex: themeColor)!
        let chartDataSet = LineChartDataSet(entries: formattedData, label: legendLabel)
        chartDataSet.setColor(realThemeColour)
        chartDataSet.setCircleColor(realThemeColour)
        chartDataSet.circleRadius = 3.0
        chartDataSet.drawValuesEnabled = false
        let chartDataFormatted = LineChartData(dataSets: [chartDataSet])
        self.data = chartDataFormatted
        
        // Update theme colour
        let textColour = darkMode ? UIColor.white : UIColor.black
        self.leftAxis.labelTextColor = textColour
        self.legend.textColor = textColour
        print(legendLabel, darkMode, themeColor)
    }

    /** Some basic styling for LineChartView */
    private func setupLineChart() {
        // Text related
        self.noDataText = "No Information are provided"
        self.chartDescription?.text = ""
        
        // Disable zoom and interaction
        self.highlightPerTapEnabled = false
        self.highlightPerDragEnabled = false
        self.setScaleEnabled(false)

        // Custom style for xAxia
        self.xAxis.labelPosition = .bottom
        self.xAxis.setLabelCount(chartData.count, force: false)
        self.xAxis.drawGridLinesEnabled = false
        self.xAxis.drawLabelsEnabled = false
        
        // Custom style for rightAxis
        self.rightAxis.drawLabelsEnabled = false
        self.rightAxis.drawGridLinesEnabled = false
        self.rightAxis.drawAxisLineEnabled = false
        
        // Custom style for leftAxis
        self.leftAxis.drawLabelsEnabled = true
        self.leftAxis.drawGridLinesEnabled = false
        self.leftAxis.drawAxisLineEnabled = true
    }
}
