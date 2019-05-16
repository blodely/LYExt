# Created by Luo Yu(blodely, http://luoyu.space), indie.luo@gmail.com
# Be sure to run `pod lib lint LYExt.podspec' to ensure this
#

Pod::Spec.new do |s|
  s.name             = 'LYExt'
  s.version          = '0.1.0'
  s.summary          = 'LYExt.'

  s.description      = <<-DESC
The extensions for iOS developing in Swift
                       DESC

  s.homepage         = 'https://github.com/blodely/LYExt'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'blodely' => 'indie.luo@gmail.com' }
  s.source           = { :git => 'https://github.com/blodely/LYExt.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'LYExt/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYExt' => ['LYExt/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
