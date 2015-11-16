#
#  Be sure to run `pod spec lint Template.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "Template"
  s.version      = "0.1.1"
  s.summary      = "This is a short description of a Template Please dont use this "
  s.requires_arc = true

  s.description  = <<-DESC
                    This is a description of a simple project template it is written in swift
                   DESC

  s.homepage     = "https://github.com/rickzonhagos/Template"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "rickzonhagos" => "rickzonhagos@gmail.com" }

  # s.platform     = :ios
   s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/rickzonhagos/Template.git", :tag => "0.1.1" }



  s.source_files  =  "Template", "Template/*"
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "UIKit"
s.framework = "UIKit"
s.framework = "Security"
s.dependency 'SwiftKeychain', '~> 0.1'
s.dependency 'MBProgressHUD', '~> 0.9'
s.dependency 'OCMock', '~> 3.2'
s.dependency 'SwiftyJSON', '~> 2.3'
s.dependency 'MMDrawerController', '~> 0.6'
s.dependency 'Flurry-iOS-SDK', '~> 7.3'
s.dependency 'RNCryptor', '~> 4.0'



end
