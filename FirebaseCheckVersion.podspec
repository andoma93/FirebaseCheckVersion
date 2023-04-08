#
# Be sure to run `pod lib lint FirebaseCheckVersion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FirebaseCheckVersion'
  s.version          = '1.1.0'
  s.summary          = 'Notify users about updates of your application'
  s.swift_version    = '5.8'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A simple Library that notifies users when a new version of your app is available through Firebase Remote Configuration
                       DESC

  s.homepage         = 'https://github.com/andoma93/FirebaseCheckVersion'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andoma93' => 'andoma93@gmail.com' }
  s.source           = { :git => 'https://github.com/andoma93/FirebaseCheckVersion.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/andoma93'

  s.ios.deployment_target = '13.0'

  s.source_files = 'FirebaseCheckVersion/Classes/**/*'
  s.source_files = 'Sources/FirebaseCheckVersion/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CheckVersion' => ['CheckVersion/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Firebase/RemoteConfig'
  s.static_framework = true
end
