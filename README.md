# Zoom Video SDK UI toolkit Sample Project 

The [Zoom Video SDK UI toolkit](https://developers.zoom.us/docs/video-sdk/ios/ui-kit/) is a prebuilt video chat user interface powered by the Zoom Video SDK.

The UI toolkit enables you to instantly start using a core set of Video SDK features in your app, including:
- Feature configuration
- Join and leave sessions
- Video on or off
- Front or back camera
- Mute and unmute
- Session chat (group and private)
- Active speaker and gallery view
- Participant management (with host and manager role)
- Virtual background
- Portrait and landscape support
- Screen share

The use of this UI Took Kit is subject to the [Video SDK terms of service](https://explore.zoom.us/en/video-sdk-terms/). Copyright 2024 Zoom Video Communications, Inc. All rights reserved.

## Authorize

Learn how to use your credentials to [authenticate](https://developers.zoom.us/docs/video-sdk/auth/#generate-a-video-sdk-jwt) so you can connect.

See the [Video SDK Auth Endpoint Sample](https://github.com/zoom/videosdk-sample-signature-node.js) for a sample app that shows how to quickly, easily, and securely generate a Video SDK JWT.

## Installation, Build & Launch

Currently, the sample app consists of 4 dynamic xcframeworks ZoomVideoSDK.xcframework,  ZoomVideoSDKUIKit.xcframework, zoomcml.xcframework and CptShare.xcframework which are added with "Embed & Sign" and can be located directly under the ZoomVideoSDKUIToolkitSample. In addition, the app also consist of screen sharing (broadcasting the device screen) feature under its own target ScreenShare using ReplayKit and ZoomVideoSDKScreenShare.xcframework with "Do Not Embed". For screen sharing to work, app group ID is required.

Build and run the sample app by navigating ViewController.swift and key in the following placeholders. If your session requires a password, you can make use of the password parameter.

```Swift
let jwt = <#JWT#>
let sessionName = <#Session Name#>
let username = <#Username#>
let appGroupId = <#App Group ID#>

// If your session requires a password, you can use the password variable here as well.
// let password = "<#Password#>
```

<br>

The variables above are used to set up a connection with the Video SDK. If your session requires a password, you must use the **SessionContext** class that comes with a sessionPassword parameter.

```Swift
// If your session requires a password, you will need to add it under the sessionPassword parameter under SessionContext.
// let vc = UIToolkitVC(sessionContext: SessionContext(jwt: jwt, sessionName: sessionName, sessionPassword: password, username: username))

/*
 Under the InitParams:
 1. If your session allows screen sharing, you will need to add the App Group ID parameter,
 2. By default the UI Toolkits comes with all available features (with some features require additional license). If you will like to only use some of these features, you will need to add the features you want under the features parameter.
 */
// let vc = UIToolkitVC(sessionContext: SessionContext(jwt: jwt, sessionName: sessionName, username: username), initParams: InitParams(appGroupId: appGroupId, features: [.Audio, .Video, .Users]))

let vc = UIToolkitVC(sessionContext: SessionContext(jwt: jwt, sessionName: sessionName, username: username))
vc.delegate = self
vc.modalPresentationStyle = .fullScreen
present(vc, animated: true)
```

<br>

There is a delegate class **UIToolkitDelegate** which consists of essential callbacks such as error, view is loaded, and dismissed.

```Swift
extension ViewController: UIToolkitDelegate {
    func onError(_ errorType: UIToolkitError) {
        print("Sample VC onError Callback: \(errorType.rawValue) -> \(errorType.description)")
    }
    
    func onViewLoaded() {
        print("Sample VC onViewLoaded")
    }
    
    func onViewDismissed() {
        print("Sample VC onViewDismissed")
    }
}
```

## Integration

You can integrate the UI toolkit frameworks manually or via the Swift Package Manager or Cocoapod.

### Manual

You can integrate the Zoom Video SDK UI toolkit into your project by adding the 2 essential dynamic xcframeworks: ZoomVideoSDK.xcframework and ZoomVideoSDKUIKit.xcframework found in the sample app. Be sure to select the "Embed & Sign" option for these frameworks in Xcode under your project 'General' tab. 

If you are interested in having the Virtual Background feature, you will need to include the zoomcml.xcframework in with "Embed & Sign". 

As for Screen Sharing, you will need to include the CptShare.xcframework in your main target with "Embed & Sign" while the Broadcast Target to include in ZoomVideoSDKScreenShare.xcframework with "Do not Embed". For more details, refer to our [Video SDK Screen Sharing doc](https://developers.zoom.us/docs/video-sdk/ios/share/#broadcast-the-device-screen).

### Swift Package Manager and Cocoapod

You can also add the framework using the Swift Package Manager or Cocoapod using our GitHub link: https://github.com/zoom/videosdk-ui-toolkit-ios. Do take note that there are 4 branches available and the details are as followed:
- main: SPM with all features
- essential: SPM with all features except for Virtual Background and Screen Share
- cocoapod: Cocoapod with all features
- cocoapod-essential: Cocoapod with all features except for Virtual Background and Screen Share

## Need help?

If you're looking for help, try [Developer Support](https://devsupport.zoom.us/hc/en-us) or our [Developer Forum](https://devforum.zoom.us/). Priority support is also available with [Premier Developer Support](https://explore.zoom.us/docs/en-us/developer-support-plans.html) plans.

---

Copyright 2024 Zoom Video Communications, Inc. All rights reserved.
