package org.github.henryquan.nativechart.horizontalBar

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.github.mikephil.charting.charts.HorizontalBarChart

class NativeHorizontalBarChartManager : SimpleViewManager<HorizontalBarChart>() {
    override fun getName(): String {
        return REACT_CLASS
    }

    public override fun createViewInstance(c: ThemedReactContext): HorizontalBarChart {
        return HorizontalBarChart(c)
    }

    companion object {
        const val REACT_CLASS = "NativeHorizontalBarChart"
    }
}