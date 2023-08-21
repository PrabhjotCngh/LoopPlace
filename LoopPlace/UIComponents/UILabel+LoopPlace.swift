//
//  UILabel+LoopPlace.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-21.
//

import UIKit

extension UILabel {
    
    /// Creates a customised UILabel
    /// - Parameters:
    ///     - text: text to be displayed
    ///     - font : font to be used
    ///     - lineHeightMultiple: line height
    ///     - kern: kern
    ///     - textAlignment: alignment of the text, default value is left
    ///     - textColor: color of the text
    ///     - numberOfLines: number of lines in the label, default value is 0
    ///     - lineBreak: how the text in the label should truncate, default value is byWordWrapping
    ///     - accessibilityIdentifier: identifier to be used by automation
    /// - Returns: a customised UILabel
    static func label(text: String,
                      font: UIFont,
                      lineHeightMultiple: CGFloat,
                      kern: NSNumber,
                      textAlignment: NSTextAlignment = .left,
                      textColor: UIColor,
                      numberOfLines: Int = 0,
                      lineBreak: NSLineBreakMode = .byWordWrapping,
                      accessibilityIdentifier: String) -> Self {
        let label = Self()
        label.numberOfLines = numberOfLines
        
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeightMultiple
        style.alignment = textAlignment
        style.lineBreakMode = lineBreak
        
        let attributedString = NSAttributedString(string: text,
                                                  attributes: [.kern: kern,
                                                               .paragraphStyle: style,
                                                               .font: font,
                                                               .foregroundColor: textColor])
        
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = accessibilityIdentifier
        
        return label
    }
}
