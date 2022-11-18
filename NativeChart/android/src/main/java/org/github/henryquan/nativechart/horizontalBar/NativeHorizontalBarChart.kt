package org.github.henryquan.nativechart.horizontalBar

import android.graphics.Color
import com.facebook.react.uimanager.ThemedReactContext
import com.github.mikephil.charting.charts.HorizontalBarChart
import com.github.mikephil.charting.components.XAxis
import com.github.mikephil.charting.data.BarData
import com.github.mikephil.charting.data.BarDataSet
import com.github.mikephil.charting.data.BarEntry
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet

class NativeHorizontalBarChart(c: ThemedReactContext) : HorizontalBarChart(c) {
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
    val formattedData =
      this.chartData.mapIndexed { index, element -> BarEntry(index.toFloat(), element) }

    // Setup data and colour to chart
    val chartDataSet = BarDataSet(formattedData, this.legendLabel)
    chartDataSet.color = this.themeColor
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
    this.axisLeft.setDrawLabels(true)
    this.axisLeft.setDrawAxisLine(true)

    // Custom style for axisLeft
    this.axisRight.setDrawGridLines(false)
    this.axisRight.setDrawLabels(false)
    this.axisRight.setDrawAxisLine(false)

    // Don't draw legend for this
    this.legend.isEnabled = false
  }
}
