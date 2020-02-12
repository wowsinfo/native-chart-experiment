//
//  NativeChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 11/2/20.
//

import Charts

@objc(NativeChart)
@objcMembers
class NativeChart: RCTViewManager, ChartViewDelegate {
    
    var data: [Double] = [
        0.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0
    ]

    open override class func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    override open func view() -> UIView! {
        let screen = UIScreen.main.bounds
        let view = UIView()
        print("View")
        print(view.bounds)

//        let battleLineChart = LineChartView()
//        battleLineChart.delegate = self
//        setupBattleChart(chart: battleLineChart)
//        view.addSubview(battleLineChart)
//
//        battleLineChart.translatesAutoresizingMaskIntoConstraints = false
//         battleLineChart.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//         battleLineChart.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//         battleLineChart.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//         battleLineChart.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        print("Chart")
//        print(battleLineChart.bounds)
        
        let label = UILabel()
        label.contentMode = .scaleAspectFit
        label.text = "Hello"
        label.sizeToFit()
        view.addSubview(label)
        print("Label")
        print(label.bounds)
        
 
        return view
    }
    
    private func lineChartOptimised(chart: LineChartView) {
        chart.noDataText = "No Information are provided"
        chart.isUserInteractionEnabled = false
        chart.chartDescription?.text = ""
        
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.setLabelCount(data.count, force: false)
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
        for i in 0..<data.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: data[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Recent Battle Chart")
        chartDataSet.setColor(colour)
        chartDataSet.setCircleColor(colour)
        chartDataSet.circleRadius = 3.0
        chartDataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSets: [chartDataSet])
        chart.data = chartData
        
        let avg = data.reduce(0.0, { x, y in x + y }) / Double(data.count)
        let average = ChartLimitLine(limit: avg, label: String(format: "%.1f", avg))
        average.labelPosition = .bottomRight
        average.lineWidth = 0.5
        average.lineColor = colour
        chart.rightAxis.addLimitLine(average)
    }
}
