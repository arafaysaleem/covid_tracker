# Covid Tracker - A covid-19 statistics app

![build-release](https://github.com/arafaysaleem/covid_tracker/workflows/build-release/badge.svg) ![Test PR](https://github.com/arafaysaleem/covid_tracker/workflows/Test%20PR/badge.svg) [![GitHub release](https://img.shields.io/github/release/arafaysaleem/covid_tracker?color=blue)](https://github.com/arafaysaleem/covid_tracker/releases) [![GitHub stars](https://img.shields.io/github/stars/arafaysaleem/covid_tracker?color=orange)](https://github.com/arafaysaleem/covid_tracker/stargazers) [![GitHub issues](https://img.shields.io/github/issues/arafaysaleem/covid_tracker?color=red)](https://github.com/arafaysaleem/covid_tracker/issues) [![GitHub issues](https://img.shields.io/github/issues-closed/arafaysaleem/covid_tracker?color=brightgreen)](https://github.com/arafaysaleem/covid_tracker/issues?q=is%3Aissue+is%3Aclosed) [![GitHub forks](https://img.shields.io/github/forks/arafaysaleem/covid_tracker?color=yellow)](https://github.com/arafaysaleem/covid_tracker/network) [![License: MIT](https://img.shields.io/github/license/arafaysaleem/covid_tracker)](https://github.com/arafaysaleem/covid_tracker/blob/master/LICENSE) [![made-with-python](https://img.shields.io/badge/Made%20With-Flutter-blue)](https://flutter.dev/)

Covid Tracker is an Android app made with **Flutter** framework to provide worldwide information related to Covid-19 pandemic. The intended use of this app is to provide the public with honest and easy-to-navigate information regarding Covid-19. Providing users with this information can help lessen the spread of Covid-19 and inform users about how to stay safe.

The api used for the data can be found [here](https://corona.lmao.ninja/docs/). **The release apk is available under the release tags. It's also available on this drive link - [Covid Tracker APK](https://drive.google.com/drive/folders/1xazOX_VaaAPzuccusj-hk0zsPZaomDLc?usp=sharing)**

## Table of Contents

 1. [Features](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#iphone-features)
 2. [Future Features](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-future-features)
 3. [Technologies](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-technologies)
 4. [How to start with Flutter and Dart](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#how-to-start-with-flutter-and-dart)
 5. [Further Information](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-further-information)
 6. [Contribute](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-contribute)
 7. [To Do](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-to-do)
 8. [Feedback](https://github.com/arafaysaleem/covid_tracker/blob/master/README.md#-feedback)


## :iphone: Features

  - Global case count.
  - Case, death and recovery count of each country
  - Total tests and infection probability of each country
  - News updates related to vaccine developement
  - Info, symptoms, precautions and myths of the virus
  - Setting a default country

The UI is inspired by a design on [Dribbble](https://dribbble.com/shots/10847147-Coronavirus-Covid-19-Dashboard) (credits to [Nazirul Hoque](https://dribbble.com/nazirulhoque) on Dribble).

<div align="center"><kbd><img alt="App Tour" src="Readme_files/app_tour.gif" width="260" height="538" style="border-style: solid; border-color: #FFFFFF; border-width:1px;"/></kbd></div>
<br></br>
<div align="center">
<img src="Readme_files/home_screen.png" width="260" height="538"/>&nbsp;<img src="Readme_files/global_screen.png" width="260" height="538"/>&nbsp;&nbsp;<img src="Readme_files/country_list.png" width="260" height="538"/><br></br>
<img src="Readme_files/news_screen.png" width="260" height="538"/><img src="Readme_files/country_screen.png" width="260" height="538"/>&nbsp;<img src="Readme_files/credits_screen.png" width="260" height="538"/><br></br>
<img src="Readme_files/precautions_screen.png" width="260" height="538"/>&nbsp;&nbsp;&nbsp;<img src="Readme_files/myths_screen.png" width="260" height="538"/>
</div>


## ⭐ Future Features

  - Drawer for easier navigation
  - Onboarding screens
  - Login authentication using Firebase
  - Maps API to detect nearby danger spots

*Feel free to fork and contribute to include these features.* ❤︎

## 🚀 Technologies

  - [Flutter v1.17.4](https://storage.googleapis.com/flutter_infra/releases/stable/windows/flutter_windows_1.17.4-stable.zip)
    - Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
  - [Dart v2.8.4](https://dart.dev/get-dart)
    - Dart SDK helps develop Dart web, command-line, and server apps.
  
  ### How to start with Flutter and Dart
  Note: Download the versions mentioned above for Flutter and Dart for the code to work since a different version might cause some issues.
  
  First Download Get and then install FLutter.
  - Dart - [Get Dart](https://dart.dev/get-dart)
  - Flutter - [Get Started](https://docs.flutter.dev/get-started/install)
    
## 🧠 Further Information
Your System needs to have the following:

-16 GB RAM

-64-bit Windows, macOS, Linux, or ChromeOS operating system

-16 GB disk space

Currently, this app is not available for public download on the Android app store. However, if you would like to see how the current features work, we recommend these steps:




  
1. Download [Android Studio](https://developer.android.com/studio)
2. Clone this repository
3. Use the Android Studio emulator, which has options to view the app on different phones/tablets [Run apps on the android Emulator](https://developer.android.com/studio/run/emulator).

After you have downloaded Android Studio which contains the emulator:
1. Create an Android Virtual Device, which is a virtual machine running an Androids OS. To do this Select **More Actions > Virtual Device Manager.** 
2. After opening the project, select **View > Tool Windows > Device Manager** and select **Create device**.
3. Once you have created your Virtual Device, in the toolbar select your Android Virtual Device and click **Run**.

While the emulator is running you can use your mouse to mimic your finger on the touch screen and you can use the emulator panel to perform common actions.
Instructions on how to navigate the emulator screen, [Navigate the emulator screen](https://developer.android.com/studio/run/emulator#:~:text=Navigate%20the%20emulator%20screen).



If anyone would like to add other ways of viewing the app in its current state, contributions are always welcome.

As mentioned previously, this application is only available for Android devices. However, we are working to include an IOS version. You can find the working folder for the IOS version under "ios".

## 🤝 Contribute

To contribute, fork the repository and push the changes to the **master** branch. Then submit a pull request for merging with the source. If your code passes the review and checks it will be merged into the master branch.

## 💌 To Do

1. Find new API to draw data from
2. Add future features (can be found above)
3. Insert comments into code for future contributors
4. Create plan to have first version on the Android app store
5. Continue with IOS version

## 💬 Feedback

Feel free to send us feedback on [Twitter](https://twitter.com/gitpointapp) or [file an issue](https://github.com/arafaysaleem/covid_tracker/issues/new). Feature requests are always welcome.

## 📝 License

Licensed under the [MIT License](./LICENSE).
