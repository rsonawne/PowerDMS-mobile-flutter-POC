Pod::Spec.new do |spec|
  spec.name = 'PowerDMS-mobile-flutter-POC'
  spec.version = '1.0.0'
  spec.summary = 'PowerDMS mobile Flutter POC'
  spec.description = 'A proof of concept Flutter module for PowerDMS mobile app'
  spec.homepage = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
  spec.source = { :git => 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC.git', :tag => spec.version.to_s }

  spec.platform = :ios, '9.0'

  spec.pod_target_xcconfig = {
    'SWIFT_VERSION' => '5.0'
  }

  spec.source_files = 'Classes/**/*'

  spec.subspec 'FlutterSDK' do |sdk|
    sdk.dependency 'Flutter'
    sdk.dependency 'FlutterPluginRegistrant' 
  end

  flutter_framework_path = Dir.glob(File.join(File.dirname(__FILE__), '**', 'FlutterPluginRegistrant.framework')).first

  # Add the FlutterPluginRegistrant.framework file as a vendored framework
  spec.ios.vendored_frameworks = flutter_framework_path

  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Rohit Sonawane' => 'your@email.com' }
end
