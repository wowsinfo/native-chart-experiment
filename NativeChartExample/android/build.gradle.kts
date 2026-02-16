// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    val kotlinVersion = "2.1.0"
    
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.7.3")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}

allprojects {
    repositories {
        mavenLocal()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url = uri("${rootProject.projectDir}/../node_modules/react-native/android")
        }
        maven {
            // Android JSC is installed from npm
            url = uri("${rootProject.projectDir}/../node_modules/jsc-android/dist")
        }

        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
    }
}
