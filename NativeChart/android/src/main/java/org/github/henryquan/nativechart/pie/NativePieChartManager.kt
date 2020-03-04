package org.github.henryquan.nativechart.pie

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

class NativePieChartManager : SimpleViewManager<NativePieChart>() {
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