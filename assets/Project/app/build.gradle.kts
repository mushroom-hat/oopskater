import com.android.build.gradle.internal.api.BaseVariantOutputImpl

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.squareup.sqldelight")
}

repositories {
    google()
    mavenCentral()
    gradlePluginPortal()
    maven(url = "https://jitpack.io")
}

android {
    compileSdk = libs.versions.android.compileSdk.get().toInt()

    defaultConfig {
        applicationId = "com.singaporetech.notepad"
        minSdk = libs.versions.android.minSdk.get().toInt()
        targetSdk = libs.versions.android.targetSdk.get().toInt()

        versionCode = libs.versions.notepad.versionCode.get().toInt()
        versionName = libs.versions.notepad.versionName.get()

        resourceConfigurations.addAll(
            listOf(
                "en", "fr", "ko", "nl", "pl", "zh-rCN", "it", "de", "ru", "cs",
                "pt-rBR", "no", "zh-rTW", "ar", "tr", "el", "bn", "sw", "es", "ja"
            )
        )

        vectorDrawables {
            useSupportLibrary = true
        }

        buildConfigField("long", "TIMESTAMP", "${System.currentTimeMillis()}L")
    }

    buildFeatures {
        compose = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        freeCompilerArgs = freeCompilerArgs + listOf(
            "-Xopt-in=kotlin.RequiresOptIn"
        )
    }

    composeOptions {
        kotlinCompilerExtensionVersion = libs.versions.compose.get()
    }

    signingConfigs {
        create("release") {
            if(System.getenv("KSTOREFILE") != null) {
                storeFile = File(System.getenv("KSTOREFILE"))
            }

            storePassword = System.getenv("KSTOREPWD")
            keyAlias = System.getenv("KEYALIAS")
            keyPassword = System.getenv("KEYPWD")
        }
    }

    buildTypes {
        debug {
            applicationIdSuffix = ".debug"
            manifestPlaceholders["appName"] = "@string/app_name_original"
        }

        release {
            isMinifyEnabled = true
            isShrinkResources = true
            //proguardFiles.add(getDefaultProguardFile("proguard-android.txt"))
            //proguardFiles.add(File("proguard-rules.pro"))
            signingConfig = signingConfigs.getByName("release")
            manifestPlaceholders["appName"] = "@string/app_name"

            applicationVariants.all {
                outputs.map { it as BaseVariantOutputImpl }
                    .forEach { output ->
                        output.outputFileName = "${project.parent?.name}-${defaultConfig.versionName}.apk"
                    }
            }
        }
    }

    lint {
        abortOnError = false
    }
}

dependencies {
    implementation(libs.bundles.androidx)
    implementation(libs.bundles.compose)
    implementation(libs.bundles.coroutines)
    implementation(libs.bundles.koin)

    implementation(libs.commonsLang)
    implementation(libs.composePreferences)
    implementation(libs.markdownView)
    implementation(libs.material)
    implementation(libs.sqldelight)
    implementation(libs.systemuicontroller)
    implementation("androidx.navigation:navigation-fragment-ktx:2.4.1")
    implementation("androidx.navigation:navigation-ui-ktx:2.4.1")

    debugImplementation(libs.compose.ui.tooling)
}