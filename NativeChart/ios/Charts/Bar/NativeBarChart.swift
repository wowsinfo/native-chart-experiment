//
//  NativeBarChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativeBarChart : BarChartView, OptimisedBarLineChart {
    @objc var chartData: [Double] = []
    @objc var legendLabel: String = ""
    // You will need one for each bar
    @objc var xAxisLabels: [String] = []
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
    
    func updateChart() {
        let textColour = darkMode ? UIColor.white : UIColor.black
        
        // Map double to ChartDataEntry
        let formattedData = self.chartData.enumerated().map({i, element in BarChartDataEntry(x: Double(i), y: element)})
        
        let chartDataSet = BarChartDataSet(entries: formattedData, label: legendLabel)
        // Use only theme colour
        chartDataSet.colors = [UIColor(hex: themeColor)!]
        chartDataSet.valueFont = UIFont.systemFont(ofSize: 12)
        chartDataSet.valueColors = [textColour]
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        // Remove fractions
        let format = NumberFormatter()
        format.minimumFractionDigits = 0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: format))
        
        // Update xAxis label
        self.xAxis.valueFormatter = IndexAxisValueFormatter(values: xAxisLabels)
        self.xAxis.setLabelCount(self.xAxisLabels.count, force: false)
        
        // Update chart data
        self.data = chartData
        
        // Update theme colour
        self.xAxis.labelTextColor = textColour
        self.leftAxis.labelTextColor = textColour
        self.legend.textColor = textColour
    }
    
    func setupChart(chart: BarLineChartViewBase) {
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
        
        // Custom style for rightAxis
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        
        // Custom style for leftAxis
        chart.leftAxis.drawLabelsEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawAxisLineEnabled = false
        // Don't need to show the legend for this
        chart.legend.enabled = false
    }
}
