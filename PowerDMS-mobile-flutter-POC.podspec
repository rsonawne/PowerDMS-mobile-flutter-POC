# Define the path to your Flutter application in the Git repo
flutter_application_path = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'

# Load the podhelper.rb file from the Flutter application repository
podhelper_filepath = File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
load podhelper_filepath

Pod::Spec.new do |s|
  s.name             = 'PowerDMS-mobile-flutter-POC'
  s.version          = '1.0.0'
  s.license          = { :type => 'MIT' }
  s.summary          = 'Summary of your framework'
  s.homepage         = 'https://github.com/rsonawne/PowerDMS-mobile-flutter-POC'
  s.author           = { 'Your Name' => 'your@email.com' }
  s.requires_arc     = true
  
  # Specify the platform and target version
  s.platform = :ios, '9.0'
  
  # Define the location of the existing App.framework that will be stored in the new folder
  existing_framework_path = File.join(flutter_application_path, "App.framework")
  
  # Specify the files to be included in the xcframework
  s.vendored_frameworks = existing_framework_path
  
  # Specify the location for the new copied App.framework in the Pods directory
  s.prepare_command = <<-CMD
    # Create a new folder in the Pods directory to store the framework
    new_framework_path = "#{Pod::Config.instance.installation_root}/{s.name}/{s.version}"
    system %{mkdir -p "#{new_framework_path}"}
  
    # Copy the existing App.framework to the new folder
    system %{cp -R "#{existing_framework_path}" "#{new_framework_path}/App.framework"}
  CMD

end
 