package org.github.henryquan.nativechart.pie

import android.graphics.Color
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.github.mikephil.charting.charts.PieChart
import com.github.mikephil.charting.components.LimitLine
import com.github.mikephil.charting.data.Entry
import com.github.mikephil.charting.data.LineData
import com.github.mikephil.charting.data.LineDataSet
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet

class NativePieChart(c: ThemedReactContext) : PieChart(c) {
    var chartData: Array<Float> = emptyArray<Float>()
    var legendLabel: String = ""
    var darkMode: Boolean = false
    var themeColor: Int = Color.WHITE

    @ReactProp(name = "chartData")
    fun setMaxHighlightDistance(PieChart: PieChart, chartData: ReadableArray) {
        print(chartData)
//        this.chartData = chartData
    }

    @ReactProp(name = "legendLabel")
    fun setLegendLabel(PieChart: PieChart, legendLabel: String) {
        this.legendLabel = legendLabel
    }

    @ReactProp(name = "darkMode")
    fun setDarkMode(PieChart: PieChart, darkMode: Boolean) {
        this.darkMode = darkMode
    }

    @ReactProp(name = "themeColor")
    fun setThemeColor(PieChart: PieChart, themeColor: String) {
        this.themeColor = Color.parseColor(themeColor)
    }

    init {
        this.setupChart()
    }

    /**
     * Update chart
     */
    fun updateChart() {
        // Remove all lines
//        this.axisRight.removeAllLimitLines()


        // Map float to entry
        val formattedData = this.chartData.mapIndexed { index, element -> Entry(index.toFloat(), element)}

        // Setup data and colour to chart
        val dataSetList = mutableListOf<ILineDataSet>()
        val chartDataSet = LineDataSet(formattedData, this.legendLabel)
        chartDataSet.color = this.themeColor
        chartDataSet.setCircleColor(this.themeColor)
        chartDataSet.circleRadius = 3.0F
        chartDataSet.setDrawValues(false)
        dataSetList.add(chartDataSet)

        val chartDataFormatted = LineData(dataSetList)
//        this.data = chartDataFormatted*/

        // Update theme colour
        val textColour = if (darkMode) Color.WHITE else Color.BLACK
//        this.axisLeft.textColor = textColour
        this.legend.textColor = textColour

        // Add average line
        val avg = chartData.reduce { acc, curr -> acc + curr } / chartData.size.toFloat()
        val average = LimitLine(avg, String.format("%.1f", avg))
        average.labelPosition = LimitLine.LimitLabelPosition.RIGHT_BOTTOM
        average.lineWidth = 0.5F
        average.textColor = textColour
        // Fit to theme colour
        average.lineColor = this.themeColor
//        this.axisRight.addLimitLine(average)
    }

    /**
     * Setup the chart
     */
    private fun setupChart() {
        // Text related
        this.setNoDataText("...")
        this.description.text = ""

//        // Disable zoom and interaction
//        this.isHighlightPerTapEnabled = false
//        this.isHighlightPerDragEnabled = false
//        this.setScaleEnabled(false)
//
//        // Custom style for xAxia
//        this.xAxis.position = XAxis.XAxisPosition.BOTTOM
//        this.xAxis.setDrawGridLines(false)
//        this.xAxis.setDrawLabels(false)
//
//        // Custom style for axisRight
//        this.axisLeft.setDrawGridLines(false)
//        this.axisLeft.setDrawLabels(false)
//        this.axisLeft.setDrawAxisLine(false)
//
//        // Custom style for axisLeft
//        this.axisRight.setDrawGridLines(false)
//        this.axisRight.setDrawLabels(false)
//        this.axisRight.setDrawAxisLine(false)
    }
}