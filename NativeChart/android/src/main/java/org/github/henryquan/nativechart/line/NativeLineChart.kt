package org.github.henryquan.nativechart.line

import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.github.mikephil.charting.charts.BarLineChartBase
import com.github.mikephil.charting.charts.LineChart
import com.github.mikephil.charting.components.XAxis


class NativeLineChart(c: ThemedReactContext) : LineChart(c) {
    init {
        this.setupChart()
    }

    @ReactProp(name = "chartData")
    fun setMaxHighlightDistance(chart: NativeLineChart, chartData: ReadableArray) {
        print(chartData)
        // Remove all lines
        this.axisRight.removeAllLimitLines()
        
    }

    @ReactProp(name = "legendLabel")
    fun setLegendLabel(chart: NativeLineChart, legendLabel: String) {
        // Chart Data
    }

    @ReactProp(name = "darkMode")
    fun setDarkMode(chart: NativeLineChart, darkMode: Boolean) {
        // Chart Data
    }

    @ReactProp(name = "themeColor")
    fun setThemeColor(chart: NativeLineChart, themeColor: String) {
        // Chart Data
    }

    /**
     * Setup the chart
     */
    private fun setupChart() {
        // Text related
        this.setNoDataText("...")
        this.description.text = ""

        // Disable zoom and interaction
        this.isHighlightPerTapEnabled = false
        this.isHighlightPerDragEnabled = false
        this.setScaleEnabled(false)

        // Custom style for xAxia
        this.xAxis.position = XAxis.XAxisPosition.BOTTOM
        this.xAxis.setDrawGridLines(false)
        this.xAxis.setDrawLabels(false)

        // Custom style for rightAxis
        this.axisLeft.setDrawGridLines(false)
        this.axisLeft.setDrawLabels(false)
        this.axisLeft.setDrawAxisLine(false)

        // Custom style for leftAxis
        this.axisRight.setDrawGridLines(false)
        this.axisRight.setDrawLabels(false)
        this.axisRight.setDrawAxisLine(false)
    }
}