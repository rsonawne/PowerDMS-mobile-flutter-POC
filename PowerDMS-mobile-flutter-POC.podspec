Pod::Spec.new do |s|
  s.name         = 'PowerDMS-mobile-flutter-POC' # Replace with the actual name of your Flutter module
  s.version      = '1.0.0'
  s.summary      = 'A Flutter module example for integration'
  s.description  = 'Description of your Flutter module'
  s.homepage     = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Rohit Sonawane' => 'your.email@example.com' }

  s.platform     = :ios, '9.0'
  s.source = { :git => 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '5.0'
  }
  s.vendored_frameworks = 'build/ios/framework/**/App.framework'
  s.subspec 'FlutterSDK' do |sdk|
    sdk.dependency 'Flutter'
  end

  s.source_files = '.ios/Flutter/FlutterPluginRegistrant/Classes/**/*'
  s.public_header_files = '.ios/Flutter/FlutterPluginRegistrant/Classes/**/*.h'

  s.dependency 'Flutter' # Replace with any additional dependencies required by your Flutter module
end
