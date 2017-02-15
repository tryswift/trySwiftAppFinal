use_frameworks!

def shared_pods
    pod 'Timepiece', '~> 1.0.1'
    pod 'RealmSwift', '~> 2.4.2'
end

target 'trySwift' do
    platform :ios, '10.0'
    shared_pods
    pod 'XLPagerTabStrip', '~> 6.0.0'
    pod 'Toucan', '~> 0.6.0'
    pod 'DynamicColor', '~> 3.1.0'
    pod 'AcknowList', '~> 1.2'
    pod 'BuddyBuildSDK'
    pod 'TrySwiftData', :git => 'https://github.com/tryswift/trySwiftData.git'
end

target 'try Extension' do
    platform :watchos, '3.1'
    shared_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0.2'
        end
    end
end
