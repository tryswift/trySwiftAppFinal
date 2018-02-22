use_frameworks!

def shared_pods
    pod 'Timepiece'
    pod 'TrySwiftData', :git => 'https://github.com/tryswift/trySwiftData.git'

    # for local development
    # pod 'TrySwiftData', :path => "/Users/natashatherobot/Dropbox/NatashaTheRobot/trySwift/trySwiftApp/trySwiftData"
end

target 'trySwift' do
    platform :ios, '11.0'
    shared_pods
    pod 'XLPagerTabStrip'
    pod 'DynamicColor'
    pod 'AcknowList'
    pod 'Kingfisher'
end

target 'try! Extension' do
    platform :watchos, '4.0'
    shared_pods
end

target 'try! Today' do
    platform :ios, '11.0'
    shared_pods
end
