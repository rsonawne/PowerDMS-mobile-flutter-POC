# Pod::Spec.new do |spec|
#   spec.name = 'PowerDMS-mobile-flutter-POC'
#   spec.version = '1.0.0'
#   spec.summary = 'PowerDMS mobile Flutter POC'
#   spec.description = 'A proof of concept Flutter module for PowerDMS mobile app'
#   spec.homepage = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
#   spec.source = { :git => 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC.git', :tag => spec.version.to_s }

#   spec.platform = :ios, '9.0'

#   spec.pod_target_xcconfig = {
#     'SWIFT_VERSION' => '5.0'
#   }

#   spec.source_files = '.ios/Flutter/FlutterPluginRegistrant/Classes/**/*'

#   spec.subspec 'FlutterSDK' do |sdk|
#     sdk.dependency 'Flutter'
#   end

 
#   spec.license = { :type => 'MIT', :file => 'LICENSE' }
#   spec.author = { 'Rohit Sonawane' => 'your@email.com' }
# end

Pod::Spec.new do |s|
  s.name         = 'PowerDMS-mobile-flutter-POC' # Replace with the actual name of your Flutter module
  s.version      = '1.0.0'
  s.summary      = 'A Flutter module example for integration'
  s.description  = 'Description of your Flutter module'
  s.homepage     = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Rohit Sonawane' => 'your.email@example.com' }

  s.platform     = :ios, '9.0'
  s.source = { :git => 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC.git', :tag => spec.version.to_s }

  s.source_files = 'ios/Classes/**/*'
  s.public_header_files = 'ios/Classes/**/*.h'

  s.dependency 'Flutter' # Replace with any additional dependencies required by your Flutter module
end
