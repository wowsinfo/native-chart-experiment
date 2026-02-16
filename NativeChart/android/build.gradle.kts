// android/build.gradle.kts

// Modern build configuration for React Native 0.83+

val DEFAULT_COMPILE_SDK_VERSION = 35
val DEFAULT_MIN_SDK_VERSION = 24
val DEFAULT_TARGET_SDK_VERSION = 35

fun safeExtGet(prop: String, fallback: Any): Any {
    return rootProject.extra.takeIf { it.has(prop) }?.get(prop) ?: fallback
}

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
    id("maven-publish")
}

android {
    compileSdk = (safeExtGet("compileSdkVersion", DEFAULT_COMPILE_SDK_VERSION) as Int)
    
    defaultConfig {
        minSdk = (safeExtGet("minSdkVersion", DEFAULT_MIN_SDK_VERSION) as Int)
        targetSdk = (safeExtGet("targetSdkVersion", DEFAULT_TARGET_SDK_VERSION) as Int)
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    
    kotlinOptions {
        jvmTarget = "17"
    }
    
    lint {
        abortOnError = false
    }
    
    namespace = "org.github.henryquan.nativechart"
}

repositories {
    mavenLocal()
    google()
    mavenCentral()
    maven {
        url = uri("https://jitpack.io")
    }
}

dependencies {
    implementation("com.facebook.react:react-android")
    implementation("org.jetbrains.kotlin:kotlin-stdlib")
    implementation("com.github.PhilJay:MPAndroidChart:v3.1.0")
}
