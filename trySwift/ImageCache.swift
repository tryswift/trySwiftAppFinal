//
//  ImageCache.swift
//  trySwift
//
//  Created by Bhargav Gurlanka on 2/15/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

/// Implements a simple disk cache
/// Heavily inspired from https://github.com/onevcat/Kingfisher/blob/master/Sources/ImageCache.swift
class ImageCache {
    static let sharedInstance = ImageCache()
    private(set) var isWarmedUp: Bool
    private let ioQueue: dispatch_queue_t
    private let fileManager: NSFileManager
    private let diskCachePath: String
    
    init() {
        isWarmedUp = false
 
        let cacheName = "com.natashatherobot.trySwift.imgCache"
        let dstPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!
        
        diskCachePath = (dstPath as NSString).stringByAppendingPathComponent(cacheName)
        ioQueue = dispatch_queue_create(cacheName, DISPATCH_QUEUE_SERIAL)
        fileManager = NSFileManager()
    }
    
    func warmUp(imagesClosure: () -> [(key: String, image: UIImage)]) {
        dispatch_async(ioQueue) { () -> Void in
            
            guard !self.fileManager.fileExistsAtPath(self.diskCachePath) else {
                // already cached
                self.isWarmedUp = true
                return
            }
            
            do {
                try self.fileManager.createDirectoryAtPath(self.diskCachePath, withIntermediateDirectories: true, attributes: nil)
            } catch _ {}
            
            let images = imagesClosure()
        
            images.forEach { (key, image) -> () in
                guard let data: NSData = UIImagePNGRepresentation(image) else {
                    // couldn't convert to PNG, skipping
                    return
                }
                self.fileManager.createFileAtPath(self.cachePathForKey(key), contents: data, attributes: nil)
            }
            
            self.isWarmedUp = true
        }
    }
    
    private func cachePathForKey(key: String) -> String {
        return (diskCachePath as NSString).stringByAppendingPathComponent(key)
    }
    
    func retrieveImage(forKey key: String, completion: (UIImage?) -> (Void)) {
        func runCompletionOnMainThread(withImage image: UIImage?) {
            dispatch_async(dispatch_get_main_queue()) {
                completion(image)
            }
        }
        
        dispatch_async(ioQueue) {
            let imageCachePath = self.cachePathForKey(key)
            let image = UIImage(contentsOfFile: imageCachePath)
            runCompletionOnMainThread(withImage: image)
        }
    }
}