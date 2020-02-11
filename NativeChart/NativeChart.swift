//
//  NativeChart.swift
//  react-native-native-chart
//
//  Created by Yiheng Quan on 11/2/20.
//

@objc(NativeChart)
open class NativeChart: RCTViewManager {
    override open func view() -> UIView! {
        let label = UILabel()
        label.text = "Hello World React Native"
        let view = UIView()
        view.addSubview(label)
        return view
    }
}
