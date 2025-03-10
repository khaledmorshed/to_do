import java.util.Properties
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

fun loadPropertiesFile(fileName: String): Properties {
    val properties = Properties()
    val propertiesFile = rootProject.file(fileName)
    if (propertiesFile.exists()) {
        propertiesFile.reader().use { reader ->
            properties.load(reader)
        }
    }
    return properties
}

val localProperties = loadPropertiesFile("local.properties")
val keystoreProperties = loadPropertiesFile("key.properties")
val flutterRoot = localProperties.getProperty("flutter.sdk")
val flutterVersionCode = localProperties.getProperty("flutter.versionCode")
val flutterVersionName = localProperties.getProperty("flutter.versionName")

fun getCurrentFlavor(): String {
    val gradle = gradle
    val tskReqStr = gradle.startParameter.taskRequests.toString()

    val pattern = when {
        tskReqStr.contains("assemble") -> Regex("assemble(\\w+)(Release|Debug)")
        tskReqStr.contains("bundle") -> Regex("bundle(\\w+)(Release|Debug)")
        else -> Regex("generate(\\w+)(Release|Debug)")
    }

    val matcher = pattern.find(tskReqStr)

    return matcher?.groupValues?.get(1)?.lowercase() ?: run {
        println("NO MATCH FOUND")
        ""
    }
}


android {
    namespace = "com.example.to_do"
    compileSdk = 35
    ndkVersion = "27.2.12479018"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.to_do"
        minSdk = 21
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties.getProperty("keyAlias")
            keyPassword = keystoreProperties.getProperty("password")
            storeFile = keystoreProperties.getProperty("storeFile")?.let { file(it) }
            storePassword = keystoreProperties.getProperty("password")
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "environment"
    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
        }
        create("prod") {
            dimension = "environment"
        }
    }
}

flutter {
    source = "../.."
    target = "lib/main_" + getCurrentFlavor() + ".dart"
}