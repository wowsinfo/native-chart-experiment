//
//  NativeLineChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativeLineChart : LineChartView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lineChartOptimised()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc var chartData: [Double] = [] {
        didSet {
            print(self.chartData)
            self.setupBattleChart()
        }
    }
    
    private func setupBattleChart() {
        // Remove all lines
        self.rightAxis.removeAllLimitLines()
        let colour = UIColor(red: 35/255, green: 135/255, blue: 255/255, alpha: 1.0)
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<chartData.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: chartData[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Recent Battle")
        
        chartDataSet.setColor(colour)
        chartDataSet.setCircleColor(colour)
        chartDataSet.circleRadius = 3.0
        chartDataSet.drawValuesEnabled = false
        let chartDataFormatted = LineChartData(dataSets: [chartDataSet])
        self.data = chartDataFormatted
        
        let avg = chartData.reduce(0.0, { x, y in x + y }) / Double(chartData.count)
        let average = ChartLimitLine(limit: avg, label: String(format: "%.1f", avg))
        average.labelPosition = .bottomRight
        average.lineWidth = 0.5
        average.lineColor = colour
        average.valueTextColor = UIColor.white
        self.rightAxis.addLimitLine(average)
    }
    
    private func lineChartOptimised() {
        self.noDataText = "No Information are provided"
        self.highlightPerTapEnabled = false
        self.highlightPerDragEnabled = false
        self.setScaleEnabled(false)
        self.chartDescription?.text = ""
        
        self.xAxis.labelPosition = .bottom
        self.xAxis.setLabelCount(chartData.count, force: false)
        self.xAxis.drawGridLinesEnabled = false
        self.xAxis.drawLabelsEnabled = false
        
        self.rightAxis.drawLabelsEnabled = false
        self.rightAxis.drawGridLinesEnabled = false
        self.rightAxis.drawAxisLineEnabled = false
        
        self.leftAxis.drawLabelsEnabled = true
        self.leftAxis.drawGridLinesEnabled = false
        self.leftAxis.drawAxisLineEnabled = true
        // White text
        self.leftAxis.labelTextColor = UIColor.white
        self.legend.textColor = UIColor.white
    }
}
