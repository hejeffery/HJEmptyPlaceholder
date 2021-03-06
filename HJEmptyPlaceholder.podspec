#
#  Be sure to run `pod spec lint HJEmptyPlaceholder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "HJEmptyPlaceholder"
  s.version      = "1.0.0"
  s.summary      = "A empty placeholder for iOS"
  s.homepage     = "https://github.com/hejeffery/HJEmptyPlaceholder.git"
  s.license      = "MIT"
  s.author             = { "hejeffery" => "553504116@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/hejeffery/HJEmptyPlaceholder.git", :tag => "v1.0.0" }
  s.source_files = "HJEmptyPlaceholder/Source/*.{h,m}"
  s.requires_arc = true
end