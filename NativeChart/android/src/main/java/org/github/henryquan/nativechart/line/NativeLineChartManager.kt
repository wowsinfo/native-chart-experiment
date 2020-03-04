package org.github.henryquan.nativechart.line

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

class NativeLineChartManager : SimpleViewManager<NativeLineChart>() {
    override fun getName(): String {
        return REACT_CLASS
    }

    override fun onAfterUpdateTransaction(view: NativeLineChart?) {
        // Update chart after everything has been set
        view?.updateChart()
    }

    public override fun createViewInstance(c: ThemedReactContext): NativeLineChart {
        return NativeLineChart(c)
    }

    companion object {
        const val REACT_CLASS = "NativeLineChart"
    }
}