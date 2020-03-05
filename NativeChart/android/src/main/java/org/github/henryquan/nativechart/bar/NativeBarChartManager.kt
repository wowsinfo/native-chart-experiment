package org.github.henryquan.nativechart.bar

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import android.graphics.Color
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import org.github.henryquan.nativechart.bar.NativeBarChart
import org.github.henryquan.nativechart.horizontalBar.NativeHorizontalBarChart

class NativeBarChartManager : SimpleViewManager<NativeBarChart>() {
    @ReactProp(name = "chartData")
    fun setChartData(chart: NativeBarChart, chartData: ReadableArray) {
        print(chartData)
        chart.chartData = chartData.toArrayList() as ArrayList<Float>
    }

    @ReactProp(name = "xAxisLabels")
    fun setXAxisLabels(chart: NativeBarChart, xAxisLabels: ReadableArray) {
        chart.xAxisLabels = xAxisLabels.toArrayList() as ArrayList<String>
    }

    @ReactProp(name = "legendLabel")
    fun setLegendLabel(chart: NativeBarChart, legendLabel: String) {
        chart.legendLabel = legendLabel
    }

    @ReactProp(name = "darkMode")
    fun setDarkMode(chart: NativeBarChart, darkMode: Boolean) {
        chart.darkMode = darkMode
    }

    @ReactProp(name = "themeColor")
    fun setThemeColor(chart: NativeBarChart, themeColor: String) {
        chart.themeColor = Color.parseColor(themeColor)
    }

    override fun onAfterUpdateTransaction(view: NativeBarChart) {
        // Update chart after everything has been set
        view.updateChart()
        super.onAfterUpdateTransaction(view)
    }

    override fun getName(): String {
        return REACT_CLASS
    }

    public override fun createViewInstance(c: ThemedReactContext): NativeBarChart {
        return NativeBarChart(c)
    }

    companion object {
        const val REACT_CLASS = "NativeBarChart"
    }
}