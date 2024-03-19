Pod::Spec.new do |spec|
  spec.name = 'FlutterPluginRegistrant'
  spec.version = '1.0.0'
  spec.summary = 'Flutter Plugin Registrant for iOS'
  spec.description = 'This pod registers Flutter plugins for iOS apps.'
  spec.source = { :git => 'https://github.com/flutter/flutter.git', :tag => 'v1.0.0' }
  spec.platform = :ios, '9.0'
  spec.description = 'This pod integrates the required plugins and modules for Flutter in an iOS project.'
  spec.license = 'MIT'
  spec.source_files = 'Classes/**/*'
  spec.ios.vendored_frameworks = 'Frameworks/FlutterPluginRegistrant.framework'
end
