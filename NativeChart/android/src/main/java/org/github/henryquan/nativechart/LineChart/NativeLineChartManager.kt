package org.github.henryquan.nativechart

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import android.view.View
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import org.github.henryquan.nativechart.LineChart.NativeLineChart

class NativeLineChartManager : SimpleViewManager<NativeLineChart>() {
    override fun getName(): String {
        return REACT_CLASS
    }

    public override fun createViewInstance(c: ThemedReactContext): NativeLineChart {
        return NativeLineChart(c)
    }

    companion object {
        const val REACT_CLASS = "NativeLineChart"
    }
}