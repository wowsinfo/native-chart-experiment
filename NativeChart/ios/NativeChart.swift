//
//  NativeChart.swift
//  react-native-native-chart
//
//  Created by Yiheng Quan on 11/2/20.
//

import Charts

@objc(NativeChart)
open class NativeChart: RCTViewManager {
    override open func view() -> UIView! {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Hello World\nRendered from Native"
        label.sizeToFit()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }
}
