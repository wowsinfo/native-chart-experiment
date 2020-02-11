//
//  NativeChart.swift
//  react-native-native-chart
//
//  Created by Yiheng Quan on 11/2/20.
//

import Charts

@objc(NativeChart)
open class NativeChart: RCTViewManager, ChartViewDelegate {
    private var battleLineChart: LineChartView
    private let recentData: [Double] = [
        20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0
    ]
    
    public override init() {
        battleLineChart = LineChartView()
        super.init()
        battleLineChart.delegate = self
        setupBattleChart(chart: battleLineChart)
    }

    open override class func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    override open func view() -> UIView! {
        let view = UIView()
        view.addSubview(battleLineChart)
        return view
    }
    
    private func lineChartOptimised(chart: LineChartView) {
        chart.noDataText = "No Information are provided"
        chart.isUserInteractionEnabled = false
        chart.chartDescription?.text = ""
        
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.setLabelCount(recentData.count, force: false)
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.drawLabelsEnabled = false
        
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        
        chart.leftAxis.drawLabelsEnabled = true
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawAxisLineEnabled = true
    }
    
    private func setupBattleChart(chart: LineChartView) {
        lineChartOptimised(chart: chart)
        let colour = UIColor(red: 35/255, green: 135/255, blue: 255/255, alpha: 1.0)
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<recentData.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: recentData[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Recent Battle Chart")
        chartDataSet.setColor(colour)
        chartDataSet.setCircleColor(colour)
        chartDataSet.circleRadius = 3.0
        chartDataSet.drawValuesEnabled = false
        let chartData = LineChartData.init(dataSets: [chartDataSet])
        chart.data = chartData
        
        let avg = recentData.reduce(0.0, { x, y in x + y }) / Double(recentData.count)
        let average = ChartLimitLine(limit: avg, label: String(format: "%.1f", avg))
        average.labelPosition = .bottomRight
        average.lineWidth = 0.5
        average.lineColor = colour
        chart.rightAxis.addLimitLine(average)
    }
}
