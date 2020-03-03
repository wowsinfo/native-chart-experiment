//
//  NativePieChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 12/2/20.
//

import Charts

class NativePieChart : PieChartView {
    override func didSetProps(_ changedProps: [String]!) {
        super.didSetProps(changedProps)
//        self.updateChart()
    }
    
    init() {
        super.init(frame: CGRect())
//        setupChart(chart: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
