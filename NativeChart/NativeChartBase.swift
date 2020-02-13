//
//  NativeChartBase.swift
//  NativeChart
//
//  Created by Yiheng Quan on 13/2/20.
//

import Charts

class NativeChartBase : ChartViewBase {
    init() {
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
