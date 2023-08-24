//
//  LoopPlaceColors.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-21.
//

import UIKit

public extension UIColor {
    static let grayBackground = UIColor.named("grayBackground")
    static let gray = UIColor.named("gray")
    static let labelPrimary = UIColor.named("labelPrimary")
}

extension UIColor {
    
    static func named(_ name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            fatalError("Failed to initialize UIColor named: \(name)")
        }
        return color
    }
}
