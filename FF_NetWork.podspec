#
# Be sure to run `pod lib lint FF_NetWork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FF_NetWork'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FF_NetWork.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/flashbody@foxmail.com/FF_NetWork'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'flashbody@foxmail.com' => '742043728@qq.com' }
  s.source           = { :git => 'https://github.com/flashbody/FF_NetWork.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'FF_NetWork/Classes/**/*'
  s.ios.deployment_target = '10.0'
  s.static_framework = true
  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.xcconfig = {
     'VALID_ARCHS' =>  'arm64 arm64e armv7 armv7s x86_64',
   }
  s.public_header_files = 'Pod/Classes/**/*.h'
   s.dependency 'YTKNetwork'
   s.dependency 'YYKit'
   s.dependency 'AFNetworking'
end
