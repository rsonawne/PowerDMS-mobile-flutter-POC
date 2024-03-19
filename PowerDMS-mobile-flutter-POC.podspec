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

  spec.source_files = 'lib/**/*'

  spec.subspec 'FlutterSDK' do |sdk|
    sdk.dependency 'Flutter'
  end
  
  flutter_sdk_path = Gem::Specification.find_by_name('flutter').gem_dir
  flutter_plugin_registrant_path = File.join(flutter_sdk_path, 'bin', 'cache', 'artifacts', 'engine', 'ios', 'FlutterPluginRegistrant.framework')

  spec.ios.vendored_frameworks = flutter_plugin_registrant_path

  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Rohit Sonawane' => 'your@email.com' }
end
