import java.util.Base64

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.globenotes"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "28.0.13004108"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    val dartDefines: Map<String, String> = if (project.hasProperty("dart-defines")) {
        val dartDefinesEncoded = project.property("dart-defines") as String
        dartDefinesEncoded
            .split(",")
            .associate { encoded ->
                val decoded = String(Base64.getDecoder().decode(encoded))
                val (key, value) = decoded.split("=", limit = 2)
                key to value
            }
    } else {
        emptyMap()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.globenotes"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        resValue("string", "facebook_app_id", dartDefines["FACEBOOK_APP_ID"] ?: "")
        resValue("string", "fb_login_protocol_scheme", dartDefines["FB_LOGIN_PROTOCOL_SCHEME"] ?: "")
        resValue("string", "facebook_client_token", dartDefines["FB_CLIENT_TOKEN"] ?: "")
    }

    signingConfigs {
        getByName("debug") {
            keyAlias = "android_debug_key"
            keyPassword = "android"
            storeFile = file("android_debug.jks")
            storePassword = "android"
        }
    }

    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
        getByName("release") {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}


flutter {
    source = "../.."
}