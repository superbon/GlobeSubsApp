# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'GlobeSubsApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for GlobeSubsApp
  
  pod 'RevealingSplashView'

  target 'GlobeSubsAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GlobeSubsAppUITests' do
    # Pods for testing
  end

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "11.0"
    end
  end
end
