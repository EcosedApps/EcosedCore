pluginManagement {
    val flutter = run {
        val properties = java.util.Properties()
        file(path = "local.properties").inputStream().use { prop ->
            return@use properties.load(prop)
        }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(value = flutterSdkPath != null) {
            return@require "flutter.sdk not set in local.properties"
        }
        return@run "$flutterSdkPath/packages/flutter_tools/gradle"
    }

    includeBuild(flutter)

    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id(id = "dev.flutter.flutter-plugin-loader") version "1.0.0" apply true
    id(id = "com.android.application") version "8.5.1" apply false
    id(id = "org.jetbrains.kotlin.android") version "1.9.21" apply false
}

rootProject.name = "EcosedCore"
include(":app")