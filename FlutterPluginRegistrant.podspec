Pod::Spec.new do |spec|
  spec.name = 'FlutterPluginRegistrant'
  spec.version = '1.0.0'
  spec.summary = 'Flutter Plugin Registrant for iOS projects'
  spec.description = 'This pod integrates the required plugins and modules for Flutter in an iOS project.'
  spec.license = 'MIT'
  spec.homepage = 'https://github.com/flutter/plugins/FlutterPluginRegistrant'
  spec.author = { 'Your Name' => 'Your Email' }
  spec.platform = :ios, '9.0'
  
  spec.source = { :git => 'https://github.com/flutter/plugins.git', :tag => 'FlutterPluginRegistrant-1.0.0' }
  
  spec.source_files = 'FlutterPluginRegistrant/**/*'
  spec.resources = 'FlutterPluginRegistrant/Assets/**/*'
end