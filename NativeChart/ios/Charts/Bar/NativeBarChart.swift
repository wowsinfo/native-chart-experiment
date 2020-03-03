//
//  NativeBarChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativeBarChart : BarChartView, OptimisedBarLineChart {
    @objc var chartData: [Double] = []
    // You will need one for each bar
    @objc var legendLabel: [String] = []
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
    
    func setupChart(chart: BarLineChartViewBase) {
        // TODO
    }
    
    func updateChart() {
        // TODO
    }
}
