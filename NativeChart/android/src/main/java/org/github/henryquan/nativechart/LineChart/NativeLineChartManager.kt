package org.github.henryquan.nativechart

// AppCompatCheckBox import for React Native pre-0.60:
// import android.support.v7.widget.AppCompatCheckBox;
// AppCompatCheckBox import for React Native 0.60(+):
import android.view.View
import androidx.appcompat.widget.AppCompatCheckBox
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

class NativeLineChartManager : SimpleViewManager<View>() {
    override fun getName(): String {
        return REACT_CLASS
    }

    public override fun createViewInstance(c: ThemedReactContext): View {
        val cb = AppCompatCheckBox(c)
        cb.setChecked(true)
        return cb
    }

    companion object {
        const val REACT_CLASS = "NativeLineChart"
    }
}