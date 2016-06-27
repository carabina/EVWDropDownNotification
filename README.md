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

Implement the 3 Delegate Methods:

```swift

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
  ...
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

Once all properties set, call the following function to display the Notfication:

```swift
 /*
 * NOTE: always provide the ViewController (self.view.Superview) as first parameter
 */
 notification.presentInView(self.view.superview!, withGravityAnimation: true)
```

## Properties 

The following public properties are available, please note that some are required and some other are optional because default values have been set: 

### Required

The only two mandatory properties are the Title and Subtitle of the Notification

```swift
  /*
  * Title Attributes
  */
  
  public var titleText:String?
    
  /*
  * Subtitle Attributes
  */
  
  public var subtitleText:String?
```

### Optional

All properties below are optional. !! Note that Buttons will only be displayed if the buttonText is provided !!

```swift
  /*
  * Padding between elements
  */
  
  public var paddingBetweenElements:CGFloat = 10
    
  /*
  * Background Color If set, it overwrites the blur effect
  */
  
  public var backgroundColor:UIColor?
    
  /*
  * Title Properties
  */
  
  public var titleLabelFontSize:CGFloat = 19
  public var titleLabelColor:UIColor = UIColor.blackColor()
    
  /*
  * Subtitle Propperties
  */
  
  public var subTitleLabelFontSize:CGFloat = 14
  public var subTitleLabelColor:UIColor = UIColor.blackColor()
    
  /*
  * General Button Properties
  */
  
  public var buttonFontSize:CGFloat = 13
  public var buttonCornerRadius:CGFloat = 10
  public var buttonBorderWidth:CGFloat = 1
  public var buttonBorderColor:UIColor = UIColor.blackColor()
  public var buttonWidth:CGFloat = 75
  public var buttonHeight:CGFloat = 30
  public var buttonVerticalAligment:ButtonPosition = .Bottom
    
  /*
  * Top Button Properties
  */
  
  public var topButtonTextColor:UIColor = UIColor.blackColor()
  public var topButtonBackgroundColor:UIColor = UIColor.clearColor()
    
    
  /*
  * Bottom Button Properties
  */
  
  public var bottomButtonTextColor:UIColor = UIColor.blackColor()
  public var bottomButtonBackgroundColor:UIColor = UIColor.clearColor()
    
  /*
  * Icon Properties -> Size is squared
  */
  
  public var imageSquaredSize:CGFloat = 40
  public var image:UIImage?
    
    
  /*
  * Dismiss On Tap
  */
  
  public var dismissOnTap:Bool = false
```

## Author

CRE8IT GmbH, Switzerland

## License

EVWDropDownNotification is available under the MIT license. See the LICENSE file for more info.
