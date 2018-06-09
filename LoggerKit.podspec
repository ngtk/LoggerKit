#
# Be sure to run `pod lib lint LoggerKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoggerKit'
  s.version          = '0.1.0'
  s.summary          = 'Simple logging framework.'
  s.description      = <<-DESC
LoggerKit is simple logging framework with multiple log levels and destinations.
                       DESC
  s.homepage         = 'https://github.com/ngtk/LoggerKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kento Nagata' => 'ngtknt@me.com' }
  s.source           = { :git => 'https://github.com/ngtk/LoggerKit.git', :tag => s.version.to_s }

  s.swift_version = '3.2'
  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/LoggerKit/*.swift'
end
