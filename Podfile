use_frameworks!

pod 'XLPagerTabStrip', '~> 4.0'
pod 'Toucan', '~> 0.5.0'
pod 'Timepiece'
pod 'DynamicColor', '~> 2.3.0'
pod 'VTAcknowledgementsViewController'

#copy the acknowledgements file when installing news pods
post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods/Pods-acknowledgements.plist', 'Pods-acknowledgements.plist', :remove_destination => true)
end