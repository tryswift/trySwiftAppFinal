use_frameworks!

target 'trySwift' do
    platform :ios, '10.0'
    pod 'XLPagerTabStrip', '~> 6.0.0'
    pod 'Toucan', :git => 'https://github.com/vinzen/Toucan', :branch => 'swift3.0'
    pod 'Timepiece', :git => 'https://github.com/NatashaTheRobot/Timepiece'
    pod 'DynamicColor', '~> 3.1.0'
    pod 'VTAcknowledgementsViewController'
    pod 'RealmSwift', '~> 1.1.0'
end

target 'try Extension' do
    platform :watchos, '2.0'
    pod 'Timepiece', :git => 'https://github.com/NatashaTheRobot/Timepiece'
    pod 'RealmSwift', '~> 1.1.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
