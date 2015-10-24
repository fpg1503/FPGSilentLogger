#
# Be sure to run `pod lib lint FPGSilentLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FPGSilentLogger"
  s.version          = "0.1.1"
  s.summary          = "Plug and play automatic error and navigation logging for iOS apps."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  Plug and play automatic error and navigation logging for iOS apps.

  #TODO
  - Add a decent description
  - Add support to user navigation
  - Add options to select what to log
                       DESC

  s.homepage         = "https://github.com/fpg1503/FPGSilentLogger"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Francesco Perrotti-Garcia" => "fpg1503@gmail.com" }
  s.source           = { :git => "https://github.com/fpg1503/FPGSilentLogger.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fpg1503'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FPGSilentLogger' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'JRSwizzle'
end
