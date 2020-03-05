package org.github.henryquan.nativechart.pie

import android.graphics.Color
import com.facebook.react.uimanager.ThemedReactContext
import com.github.mikephil.charting.charts.PieChart
import com.github.mikephil.charting.data.PieData
import com.github.mikephil.charting.data.PieDataSet
import com.github.mikephil.charting.data.PieEntry
import com.github.mikephil.charting.utils.ColorTemplate

class NativePieChart(c: ThemedReactContext) : PieChart(c) {
    var chartData: ArrayList<Float> = arrayListOf()
    var dataLabels: ArrayList<String> = arrayListOf()
    var darkMode: Boolean = false
    var themeColor: Int = Color.WHITE

    init {
        this.setupChart()
    }

    /**
     * Update chart
     */
    fun updateChart() {
        // Map float to entry
        val formattedData = this.chartData.mapIndexed { index, element -> PieEntry(index.toFloat(), element)}

        // Get data set
        val chartDataSet = PieDataSet(formattedData, "")
        chartDataSet.setColors(bestChartColours(chartData.size), 1)
        chartDataSet.valueTextColor = Color.BLACK
        val chartData = PieData(chartDataSet)

        // No fraction
//        val format = NumberFormatter()
//        format.minimumFractionDigits = 0
//        chartData.setValueFormatter(DefaultValueFormatter(formatter: format))

        // Update data source
        this.data = chartData

        // Update theme colour
        val textColour = if (darkMode) Color.WHITE else Color.BLACK
        this.legend.textColor = textColour
    }

    private fun bestChartColours(size: Int): IntArray {
        return ColorTemplate.MATERIAL_COLORS
    }


    /**
     * Setup the chart
     */
    private fun setupChart() {
        // Text related
        this.setNoDataText("...")
        this.description.text = ""

        this.setDrawEntryLabels(false)
        this.setDrawSlicesUnderHole(false)

        // Disable rotation
        this.isRotationEnabled = false
        // Transparent
        this.setHoleColor(Color.TRANSPARENT)
    }
}