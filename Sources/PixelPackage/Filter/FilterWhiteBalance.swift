//
//  FilterWhiteBalance.swift
//  PixelPackage
//
//  Created by Jesse Rubio on 6/28/22.
//

import Foundation
import CoreImage

public struct FilterWhiteBalance: Filtering, Equatable, Codable {
    
    public static let range: ParameterRange<Double, FilterTemperature> = .init(min: -3000, max: 3000)
    
    public var valueTemperature: Double = 0
    
    public var valueTint: Double = 0
    
    public init() {
        
    }
    
    public func apply(to image: CIImage, sourceImage: CIImage) -> CIImage {
        return
            image
                .applyingFilter(
                    "CITemperatureAndTint",
                    parameters: [
                        "inputNeutral": CIVector.init(x: CGFloat(valueTemperature) + 6500, y: 0),
                        "inputTargetNeutral": CIVector.init(x: CGFloat(valueTint) + 6500, y: 0),
                    ]
        )
    }
    
    
}
