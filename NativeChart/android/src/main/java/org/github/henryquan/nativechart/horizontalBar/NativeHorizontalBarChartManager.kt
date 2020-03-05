package org.github.henryquan.nativechart.horizontalBar

import android.graphics.Color
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class NativeHorizontalBarChartManager : SimpleViewManager<NativeHorizontalBarChart>() {
    @ReactProp(name = "chartData")
    fun setChartData(chart: NativeHorizontalBarChart, chartData: ReadableArray) {
        print(chartData)
        chart.chartData = chartData.toArrayList() as ArrayList<Float>
    }

    @ReactProp(name = "xAxisLabels")
    fun setXAxisLabels(chart: NativeHorizontalBarChart, xAxisLabels: ReadableArray) {
        chart.xAxisLabels = xAxisLabels.toArrayList() as ArrayList<String>
    }

    @ReactProp(name = "legendLabel")
    fun setLegendLabel(chart: NativeHorizontalBarChart, legendLabel: String) {
        chart.legendLabel = legendLabel
    }

    @ReactProp(name = "darkMode")
    fun setDarkMode(chart: NativeHorizontalBarChart, darkMode: Boolean) {
        chart.darkMode = darkMode
    }

    @ReactProp(name = "themeColor")
    fun setThemeColor(chart: NativeHorizontalBarChart, themeColor: String) {
        chart.themeColor = Color.parseColor(themeColor)
    }

    override fun onAfterUpdateTransaction(view: NativeHorizontalBarChart) {
        // Update chart after everything has been set
        view.updateChart()
        super.onAfterUpdateTransaction(view)
    }

    override fun getName(): String {
        return REACT_CLASS
    }

    public override fun createViewInstance(c: ThemedReactContext): NativeHorizontalBarChart {
        return NativeHorizontalBarChart(c)
    }

    companion object {
        const val REACT_CLASS = "NativeHorizontalBarChart"
    }
}