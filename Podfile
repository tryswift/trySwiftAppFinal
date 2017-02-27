use_frameworks!

def shared_pods
    pod 'Timepiece', '~> 1.1.0'
    pod 'TrySwiftData', :git => 'https://github.com/tryswift/trySwiftData.git'
end

target 'trySwift' do
    platform :ios, '10.0'
    shared_pods
    pod 'XLPagerTabStrip', '~> 7.0.0'
    pod 'DynamicColor', '~> 3.2.1'
    pod 'AcknowList', '~> 1.2'
    pod 'Kingfisher', '~> 3.4.0'
    pod 'BuddyBuildSDK'
end

target 'try! Extension' do
    platform :watchos, '3.1'
    shared_pods
end

target 'try! Swift Conference' do
    platform :ios, '10.0'
    shared_pods
end
