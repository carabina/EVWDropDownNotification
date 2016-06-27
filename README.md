# EVWDropDownNotification

A simple but yet powerful Swift Dropdown Notification for iOS inspired by [AlvaroFranco](https://github.com/AlvaroFranco/AFDropdownNotification) but rewritten in Swift 2.2 and extended to offer much more customisation

[![Version](https://img.shields.io/cocoapods/v/EVWDropDownNotification.svg?style=flat)](http://cocoapods.org/pods/EVWDropDownNotification)
[![License](https://img.shields.io/cocoapods/l/EVWDropDownNotification.svg?style=flat)](http://cocoapods.org/pods/EVWDropDownNotification)
[![Platform](https://img.shields.io/cocoapods/p/EVWDropDownNotification.svg?style=flat)](http://cocoapods.org/pods/EVWDropDownNotification)



![Example 1](https://github.com/cre8it/EVWDropDownNotification/blob/master/Screenshots/EVWDropdownNotification.gif)

## Features

- [x] Written in Swift 2.2
- [x] Customisable Button Alignment (Top, Bottom)
- [x] Customisable Button Parameters (e.g. Corner Radius, Border Color & Width)
- [x] Customisable Button Dipslay (only Top, only Bottom, Both)
- [x] Customisable Icon
- [x] Customisable Independent Text Color & Size for Title and Subtitle
- [x] Customisable Background Color or Blur Effect
- [x] Customisable TapToDismiss Delegate
- [x] Customisable Animation

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Requires iOS SDK version > 8.0

## Installation

EVWDropDownNotification is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EVWDropDownNotification"
```

## Usage

First import the "EVWDropDownNotification" module:
```swift
import EVWDropDownNotification
```

Then extend your ViewController with the "EVWDropDownNotificationDelegate" and initialise a class variable of type "EVWDropDownNotification":

```swift
class ViewController: UIViewController, EVWDropDownNotificationDelegate {

let notification = EVWDropDownNotification()
...
```

Imnplement the 3 Delegate Methods:

```swift
class ViewController: UIViewController, EVWDropDownNotificationDelegate {

  func dropdownNotificationBottomButtonTapped() {
    //Do something
    ...
    //Dismiss the notification view
    notification.dismissWithGravityAnimation(true)
  }
    
    func dropdownNotificationTopButtonTapped() {
      //Do something
      ...
      //Dismiss the notification view
      notification.dismissWithGravityAnimation(true)
    }
    
    func dropdownNotificationDismissedWithTap() {
       //Do something
       // !!!!! NO NEED TO DISMISS THE NOTIFICATION VIEW !!!!!
    }
```

In your ViewDidLoad set the Properties for the Notification (see below for all available properties):

```swift
  notification.delegate = self
  notification.image = UIImage(named: "notification")
  notification.bottomButtonText = "Accept"
  notification.topButtonText = "Cancel"
  notification.dismissOnTap = false
  notification.buttonVerticalAligment = .Bottom
  notification.titleText = "Title Here"
  notification.subtitleText = "Message Here" 
```

## Properties 

# Required

# Optional



## Author

CRE8IT GmbH

## License

EVWDropDownNotification is available under the MIT license. See the LICENSE file for more info.
