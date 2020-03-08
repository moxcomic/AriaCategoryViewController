Pod::Spec.new do |s|
  s.name             = "AriaCategoryViewController"
  s.version          = "0.0.1"
  s.summary          = "AriaCategoryViewController"
  s.homepage         = "https://github.com/moxcomic/AriaCategoryViewController.git"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "moxcomic" => "656469762@qq.com" }
  s.source           = { :git => "https://github.com/moxcomic/AriaCategoryViewController.git", :tag => "#{s.version}" }
  s.ios.deployment_target = "10.0"
  s.swift_version = "5.0"
  s.source_files = "AriaCategoryViewController/Source/**/*.swift"
  s.frameworks = "UIKit", "Foundation"

  s.dependency "Then"
  s.dependency "Reusable"
  s.dependency "AriaSwiftyChain"
end