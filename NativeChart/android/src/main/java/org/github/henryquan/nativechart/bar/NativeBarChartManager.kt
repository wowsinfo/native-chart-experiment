package org.github.henryquan.nativechart.bar

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import org.github.henryquan.nativechart.bar.NativeBarChart

class NativeBarChartManager : SimpleViewManager<NativeBarChart>() {
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