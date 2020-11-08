# MyAnimeFinder
App that consumes the MyAnimeList API ([Jikan](https://jikan.docs.apiary.io/#)) with a Tinder-esque search result interface

## Built to Learn
The project helps me explore API integration and explore programmatic app development without using the Storyboard.

## Screenshots
Here are screenshots comparing the App across some devices. This will be updated once a new milestone is reached.
| iPhone 8  | iPhone 11 | iPad Pro 4th Gen |
| ------------- | ------------- | ------------- |
| <img src="/screenshots/iphone8/welcome-iphone8.png" height="400">  | <img src="/screenshots/iphone11/welcome-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/welcome-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/login-iphone8.png" height="400">  | <img src="/screenshots/iphone11/login-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/login-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/register-iphone8.png" height="400">  | <img src="/screenshots/iphone11/register-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/register-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/home-iphone8.png" height="400">  | <img src="/screenshots/iphone11/home-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/home-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/result-iphone8.png" height="400">  | <img src="/screenshots/iphone11/result-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/result-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/swipeleft-iphone8.png" height="400">  | <img src="/screenshots/iphone11/swipeleft-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/swipeleft-ipadpro.png" height="400"> |
| <img src="/screenshots/iphone8/swiperight-iphone8.png" height="400">  | <img src="/screenshots/iphone11/swiperight-iphone11.png" height="400">  | <img src="/screenshots/ipadpro/swiperight-ipadpro.png" height="400"> |

## Tech/framework used
- Xcode
- Swift
- UIKit
- MVC
- Autolayout
- REST API (Jikan)
- CocoaPods
  - Firebase (Authentication)
  - Poi (Tinder-esque UI)
  
 ## Features
 The current version of the App let's you login and create an account to search an anime. More feature will be added, like storing your liked animes to your account and adding advanced search/filter that the API supports.
 
 ## Installation
 1. Clone repo
 2. Open terminal and navigate to the root of the project
 3. Execute "pod install" (make sure you are in the folder with the Podfile)
 4. Close the project if it's open in Xcode
 5. Open the project using the new "xcworkspace" file
 6. Setup Firebase (follow the [guide](https://firebase.google.com/docs/auth/ios/start) to setup your app with Firebase)
    - Make sure you have GoogleService-Info.plist on the directory with the AppDelegate.swift
 7. Enable Sign-in using Email/Password on your Firebase under Authentication->Sign-in method
 8. On Xcode 12+, build the app then an error will be found. Fix it with Xcode suggestion and build/run the app (Get a drink while you're at it).
 9. Once it opens successfully, you may now create an account and start to use the API
 
 ## API Reference
 [Jikan](https://jikan.docs.apiary.io/#) API is used in this project.
 There is only one API call being used on the current version of the app which is found in the [MyAnimeManager.swift](/AnimeFinder/Model/MyAnimeManager.swift). This API call searches any anime title matching the "title" parameter of searchTitle function.
