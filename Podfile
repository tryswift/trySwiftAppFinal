use_frameworks!

def shared_pods
    pod 'Timepiece', '~> 1.1.0'
    # pod 'TrySwiftData', :git => 'https://github.com/tryswift/trySwiftData.git'
    
    # for local development
    pod 'TrySwiftData', :path => "/Users/natashatherobot/Dropbox/NatashaTheRobot/trySwift/trySwiftApp/trySwiftData"
end

target 'trySwift' do
    platform :ios, '11.0'
    shared_pods
    pod 'XLPagerTabStrip', '~> 8.0.0'
    pod 'DynamicColor', '~> 3.2.1'
    pod 'AcknowList', '~> 1.2'
    pod 'Kingfisher', '~> 4.6.2'
end

target 'try! Extension' do
    platform :watchos, '4.0'
    shared_pods
end

target 'try! Today' do
    platform :ios, '11.0'
    shared_pods
end
