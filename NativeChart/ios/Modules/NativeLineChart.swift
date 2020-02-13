//
//  NativeChart.swift
//  NativeChart
//
//  Created by Yiheng Quan on 11/2/20.
//

import Charts

@objc(NativeChart)
@objcMembers
open class NativeChart: RCTViewManager, ChartViewDelegate {
    open override class func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    override open func view() -> UIView! {
        return NativeLineChart()
    }
}
