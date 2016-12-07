use_frameworks!

target 'trySwift' do
    platform :ios, '10.0'
    pod 'XLPagerTabStrip', '~> 6.0.0'
    pod 'Toucan', '~> 0.6.0'
    pod 'Timepiece', '~> 1.0.1'
    pod 'DynamicColor', '~> 3.1.0'
    pod 'AcknowList', '~> 1.2'
    pod 'RealmSwift', '~> 2.1.1'
end

target 'try Extension' do
    platform :watchos, '3.1'
    pod 'Timepiece', '~> 1.0.1'
    pod 'RealmSwift', '~> 2.1.1'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0.1'
        end
    end
end
