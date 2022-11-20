//
//  NativeLineChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativeLineChart : LineChartView, OptimisedBarLineChart {
    
    @objc var chartData: [Double] = []
    @objc var legendLabel: String = ""
    @objc var darkMode: Bool = false
    @objc var themeColor: String = "#FFFFFF"
    
    override func didSetProps(_ changedProps: [String]!) {
        super.didSetProps(changedProps)
        self.updateChart()
    }
    
    init() {
        super.init(frame: CGRect())
        setupChart(chart: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** Update chart data whenever props are passed from js */
    internal func updateChart() {
        // Remove all lines to prevent drawing multiple lines
        self.rightAxis.removeAllLimitLines()

        // Map double to ChartDataEntry
        let formattedData = self.chartData.enumerated().map({ i, element in ChartDataEntry(x: Double(i), y: element)})
        
        // Setup data and colour to chart
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
        
        // Add average line
        let avg = chartData.reduce(0.0, { x, y in x + y }) / Double(chartData.count)
        let average = ChartLimitLine(limit: avg, label: String(format: "%.1f", avg))
        average.labelPosition = .rightBottom
        average.lineWidth = 0.5
        average.valueTextColor = textColour
        // Fit to theme colour
        average.lineColor = realThemeColour
        self.rightAxis.addLimitLine(average)
    }

    /** Some basic styling for LineChartView */
    internal func setupChart(chart: BarLineChartViewBase) {
        // Text related
        chart.noDataText = "No Information are provided"
        chart.chartDescription.text = ""
        
        // Disable zoom and interaction
        chart.highlightPerTapEnabled = false
        chart.highlightPerDragEnabled = false
        chart.setScaleEnabled(false)

        // Custom style for xAxia
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.drawLabelsEnabled = false
        
        // Custom style for rightAxis
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        
        // Custom style for leftAxis
        chart.leftAxis.drawLabelsEnabled = true
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawAxisLineEnabled = true
    }
}
