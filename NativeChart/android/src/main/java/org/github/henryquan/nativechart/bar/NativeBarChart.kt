package org.github.henryquan.nativechart.bar

import android.graphics.Color
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.github.mikephil.charting.charts.BarChart
import com.github.mikephil.charting.components.LimitLine
import com.github.mikephil.charting.components.XAxis
import com.github.mikephil.charting.data.*
import com.github.mikephil.charting.formatter.DefaultAxisValueFormatter
import com.github.mikephil.charting.formatter.DefaultValueFormatter
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter
import com.github.mikephil.charting.formatter.ValueFormatter
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet

class NativeBarChart(c: ThemedReactContext) : BarChart(c) {
    var chartData: ArrayList<Float> = arrayListOf()
    var xAxisLabels: ArrayList<String> = arrayListOf()
    var legendLabel: String = ""
    var darkMode: Boolean = false
    var themeColor: Int = Color.WHITE

    init {
        this.setupChart()
    }

    /**
     * Update chart
     */
    fun updateChart() {
        // Get theme colour
        val textColour = if (darkMode) Color.WHITE else Color.BLACK

        // Map float to entry
        val formattedData = this.chartData.mapIndexed { index, element -> BarEntry(index.toFloat(), element)}

        // Setup data and colour to chart
        val chartDataSet = BarDataSet(formattedData, this.legendLabel)
        chartDataSet.color = this.themeColor
        chartDataSet.valueTextSize = 12F
        chartDataSet.setValueTextColors(mutableListOf(textColour))
        chartDataSet.setDrawValues(false)



        // Set labels
        this.xAxis.valueFormatter = IndexAxisValueFormatter(this.xAxisLabels)
        this.xAxis.setLabelCount(this.xAxisLabels.size, false)

        // Update chart data
        val chartDataFormatted = BarData(mutableListOf<IBarDataSet>(chartDataSet))
        // Remove fractions
//        chartDataFormatted.setValueFormatter(DefaultAxisValueFormatter())

        this.data = chartDataFormatted

        // Update theme colour
        this.axisLeft.textColor = textColour
        this.xAxis.textColor = textColour
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

        // Custom style for axisRight
        this.axisLeft.setDrawGridLines(false)
        this.axisLeft.setDrawLabels(false)
        this.axisLeft.setDrawAxisLine(false)

        // Custom style for axisLeft
        this.axisRight.setDrawGridLines(false)
        this.axisRight.setDrawLabels(false)
        this.axisRight.setDrawAxisLine(false)

        // Don't draw leend for this
        this.legend.isEnabled = false
    }
}