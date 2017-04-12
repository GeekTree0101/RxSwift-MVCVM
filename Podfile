source 'https://github.com/CocoaPods/Specs.git'

project 'swiftMVVM.xcodeproj'
platform :ios, '10.0'
use_frameworks!

target 'swiftMVVM' do
pod 'SnapKit', '~> 3.0'
pod 'RxSwift', '~> 3.0'
pod 'RxCocoa', '~> 3.0'
pod 'RxOptional', '~> 3.1'
pod 'RxWebKit'
pod 'SwiftyJSON', '~> 3.1.4'
pod 'Alamofire', '~> 4.4'
end

post_install do |installer|
puts 'Removing static analyzer support for pods'
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['OTHER_CFLAGS'] = "$(inherited) -Qunused-arguments -Xanalyzer -analyzer-disable-all-checks"
config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'

if config.name == 'Release'
config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
else
config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
end
end
end
end
