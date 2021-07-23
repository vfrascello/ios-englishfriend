
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'EnglishFriend' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EnglishFriend
  pod 'GoogleSignIn'
  pod 'FBSDKLoginKit'
  pod 'ExytePopupView'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
       config.build_settings["VALID_ARCHS[sdk=iphonesimulator*]"] = "arm64, arm64e, armv7, armv6, i386, x86_64"
    end
  end
end
