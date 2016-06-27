#
# Be sure to run `pod lib lint EVWDropDownNotification.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EVWDropDownNotification'
  s.version          = '0.1.0'
  s.summary          = 'A simple but yet powerfull DropDown Notification for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple but yet powerfull DropDown Notification View for iOS written in Swift. The notification is fully configurable through exposed properties (e.g. Button Alignment, Text Color, Button Radius etc) and offers 3 delegate methods for events
                       DESC

  s.homepage         = 'https://github.com/cre8it/EVWDropDownNotification'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CRE8IT GmbH' => 'mobile@cre8it.ch' }
  s.source           = { :git => 'https://github.com/cre8it/EVWDropDownNotification.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'EVWDropDownNotification/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EVWDropDownNotification' => ['EVWDropDownNotification/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
