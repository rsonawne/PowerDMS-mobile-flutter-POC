Pod::Spec.new do |s|
    s.name             = 'PowerDMS-mobile-flutter-POC'
    s.version          = '0.1.0'
    s.summary          = 'A short description of PowerDMS-mobile-flutter-POC.'
    s.description      = 'A longer description of PowerDMS-mobile-flutter-POC.'
    s.homepage         = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Your Name' => 'your@email.com' }
    s.source           = { :git => 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC.git' }
    s.platform     = :ios, '16.0'
    s.source_files = 'lib/**/*'
    s.ios.deployment_target = '14.0'
    s.dependency 'Flutter'
 
end
