---
title: How to make splash screen for Android and iOS on flutter
---
In this article we will look how to make it in few ways, which way to choose is up to you.

![splash screen example](/blog/css/images/splash-screen-example.jpg)

## Connect the flutter package.

 There are a lot of packages on https://pub.dartlang.org to help you in the most of cases and this case isn't exception.
Just be sure to choose the package which have scored more than 90 points. 
This will ensure you that you choose the most up-to-date and less prone to errors package.
For this case https://pub.dartlang.org/packages/splashscreen#-analysis-tab- will do just fine.
It has sufficient amount of settings to provide you control of your splash screen.
---
    To use the package you have to add the dependency to your pubspec.yaml file
```dart
    dependencies:
        flutter:
            sdk: flutter
        splashscreen:
```
---
---
    Here is the example which is given us by the documentation:
```dart
    new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('Welcome In SplashScreen'),
      image: new Image.asset('screenshot.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red
    );
```
---

In the end you will see something like this:

![splash screen example](/blog/css/images/packageExample.png)


## Change files in the appropriate folder

### For Android

Navigate to:  android => app => src => main => res

![Path to Android](/blog/css/images/androidPath.png)

Here we seen folders with xml files and png images with different size.

![Android files](/blog/css/images/androidFiles.png)

Splash screen is active by the default but it has no image and background color is white so it makes no difference whether it is enabled or disabled. To change background color you have to create new file with xml extension in the values folder and define color and his alias. 

___
    Like this:
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="lightGreen">#2ECC71</color>
</resources>
```
___

To enable the splash screen image you have to uncomment item tag in the folder called drawable. It's sets the same image that you have on app icon. Conveniently isn't it?

___
```xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Modify this file to customize your launch splash screen -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@color/lightGreen" />

    <!-- You can insert your own image assets here -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item>
</layer-list>
```
___

### For iOS

Navigate to: ios => Runner => Assets.xcassets => LaunchImage.imageset

![Path to iOS](/blog/css/images/iosPath.png)

There you can see three images with different scale size, replace them with your images and that's all.

![Change this files](/blog/css/images/iosImages.png)

I case you want to change those files names you have to do it in contents.json file in the same folder.

---
```json
{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "LaunchImage.png",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
```
---