Pod::Spec.new do |s|
  s.name             = 'LGPromptViewModule'
  s.version          = '0.2.1'
  s.summary          = '提示组件.'

  s.description      = <<-DESC
    提示相关视图.
                       DESC

  s.homepage         = 'https://github.com/applekwork/LGPromptViewModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LG' => 'applekwork@163.com' }
  s.source           = { :git => 'https://github.com/applekwork/LGPromptViewModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LGPromptViewModule/Classes/**/*'
  
  s.resource_bundles = {
     'LGPromptViewModule' => ['LGPromptViewModule/Assets/*.png']
   }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


