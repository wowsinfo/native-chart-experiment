package org.github.henryquan.nativechart.pie

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import android.graphics.Color
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class NativePieChartManager : SimpleViewManager<NativePieChart>() {
  @ReactProp(name = "chartData")
  fun setChartData(chart: NativePieChart, chartData: ReadableArray) {
    print(chartData)
    chart.chartData = chartData.toArrayList() as ArrayList<Float>
  }

  @ReactProp(name = "dataLabels")
  fun setLegendLabel(chart: NativePieChart, dataLabels: ReadableArray) {
    chart.dataLabels = dataLabels.toArrayList() as ArrayList<String>
  }

  @ReactProp(name = "darkMode")
  fun setDarkMode(chart: NativePieChart, darkMode: Boolean) {
    chart.darkMode = darkMode
  }

  @ReactProp(name = "themeColor")
  fun setThemeColor(chart: NativePieChart, themeColor: String) {
    chart.themeColor = Color.parseColor(themeColor)
  }

  override fun onAfterUpdateTransaction(view: NativePieChart) {
    // Update chart after everything has been set
    view.updateChart()
    super.onAfterUpdateTransaction(view)
  }

  override fun getName(): String {
    return REACT_CLASS
  }

  public override fun createViewInstance(c: ThemedReactContext): NativePieChart {
    return NativePieChart(c)
  }

  companion object {
    const val REACT_CLASS = "NativePieChart"
  }
}
