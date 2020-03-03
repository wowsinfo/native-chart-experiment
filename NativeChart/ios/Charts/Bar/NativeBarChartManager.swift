//
//  NativeBarChartManager.swift
//  NativeChart
//
//  Created by Yiheng Quan on 3/3/20.
//

import Charts

@objc(NativeBarChartManager)
@objcMembers
open class NativeBarChartManager: RCTViewManager {
    open override class func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    override open func view() -> UIView! {
        return NativeBarChart()
    }
}
