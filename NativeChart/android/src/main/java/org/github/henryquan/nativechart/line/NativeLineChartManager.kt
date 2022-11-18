package org.github.henryquan.nativechart.line

import android.graphics.Color
import android.util.Log
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class NativeLineChartManager : SimpleViewManager<NativeLineChart>() {
  @ReactProp(name = "chartData")
  fun setChartData(chart: NativeLineChart, chartData: ReadableArray) {
    chart.chartData = chartData.toArrayList() as ArrayList<Float>
  }

  @ReactProp(name = "legendLabel")
  fun setLegendLabel(chart: NativeLineChart, legendLabel: String) {
    chart.legendLabel = legendLabel
  }

  @ReactProp(name = "darkMode")
  fun setDarkMode(chart: NativeLineChart, darkMode: Boolean) {
    chart.darkMode = darkMode
  }

  @ReactProp(name = "themeColor")
  fun setThemeColor(chart: NativeLineChart, themeColor: String) {
    chart.themeColor = Color.parseColor(themeColor)
  }

  override fun getName(): String {
    return REACT_CLASS
  }

  override fun onAfterUpdateTransaction(view: NativeLineChart) {
    // Update chart after everything has been set
    view.updateChart()
    super.onAfterUpdateTransaction(view)
  }

  public override fun createViewInstance(c: ThemedReactContext): NativeLineChart {
    return NativeLineChart(c)
  }

  companion object {
    const val REACT_CLASS = "NativeLineChart"
  }
}
