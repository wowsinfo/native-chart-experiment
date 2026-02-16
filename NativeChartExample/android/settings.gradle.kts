rootProject.name = "NativeChartExample"
apply(from = file("../node_modules/@react-native-community/cli-platform-android/native_modules.gradle"))
val applyNativeModulesSettingsGradle: groovy.lang.Closure<Any> by extra
applyNativeModulesSettingsGradle(settings)
include(":app")
