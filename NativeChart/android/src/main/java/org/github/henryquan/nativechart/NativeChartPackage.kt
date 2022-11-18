package org.github.henryquan.nativechart

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager
import org.github.henryquan.nativechart.bar.NativeBarChartManager
import org.github.henryquan.nativechart.horizontalBar.NativeHorizontalBarChartManager
import org.github.henryquan.nativechart.line.NativeLineChartManager
import org.github.henryquan.nativechart.pie.NativePieChartManager

class NativeChartPackage : ReactPackage {
  override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
    return emptyList()
  }

  override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
    return listOf<ViewManager<*, *>>(
      NativeLineChartManager(),
      NativeBarChartManager(),
      NativeHorizontalBarChartManager(),
      NativePieChartManager()
    )
  }
}
