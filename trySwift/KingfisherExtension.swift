//
//  KingfisherExtension.swift
//  trySwift
//
//  Created by Tim Oliver on 2/18/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

/// Processor for resizing images.
public struct AspectResizingImageProcessor: ImageProcessor {
    public let identifier: String

    /// Target size of output image should be.
    public let targetSize: CGSize

    /// The Content Mode of the image resize
    public let contentMode: UIViewContentMode

    /// Initialize a `ResizingImageProcessor`
    ///
    /// - parameter targetSize: Target size of output image should be.
    ///
    /// - returns: An initialized `ResizingImageProcessor`.
    public init(targetSize: CGSize, contentMode: UIViewContentMode = .scaleToFill) {
        self.targetSize = targetSize
        self.contentMode = contentMode
        self.identifier = "com.natashatherobot.trySwift.AspectFitResizingImageProcessor(\(targetSize))"
    }

    public func process(item: ImageProcessItem, options: KingfisherOptionsInfo) -> Image? {
        switch item {
        case .image(let image):
            return image.kf.resize(to: image.size.scaledSize(fitting: targetSize, contentMode: contentMode))
        case .data(_):
            return (DefaultImageProcessor.default >> self).process(item: item, options: options)
        }
    }
}

extension CGSize {
    public func scaledSize(fitting size: CGSize, contentMode: UIViewContentMode) -> CGSize {
        let aspectRatio = self.height == 0.0 ? 1.0 : self.width / self.height

        switch (contentMode) {
        case .scaleAspectFit:
            let aspectWidth = round(aspectRatio * size.height)
            let aspectHeight = round(size.width / aspectRatio)

            return aspectWidth > size.width ? CGSize(width: size.width, height: aspectHeight) : CGSize(width: aspectWidth, height: size.height)
        case .scaleAspectFill:
            let aspectWidth = round(aspectRatio * size.height)
            let aspectHeight = round(size.width / aspectRatio)

            return aspectWidth < size.width ? CGSize(width: size.width, height: aspectHeight) : CGSize(width: aspectWidth, height: size.height)
        default:
            return size
        }
    }
}
