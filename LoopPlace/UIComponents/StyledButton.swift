//
//  StyledButton.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-21.
//

import UIKit

struct Colors {
    static let primary: UIColor = .labelPrimary
    static let textColor: UIColor = UIColor.white
}


enum ButtonStyle {
    case primary
    case secondary
    
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return Colors.primary
        case .secondary:
            return .clear
        }
    }
    
    var disabledBackgroundColor: UIColor {
        return Colors.primary
    }
    
    var textColor: UIColor {
        switch self {
        case .primary, .secondary:
            return Colors.textColor
        }
    }
}

class StyledButton: UIButton {
    
    var style: ButtonStyle = .primary {
        didSet {
            applyStyle()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            setEnabled()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            let baseSize = super.intrinsicContentSize
            return CGSize(width: baseSize.width + 20,//ex: padding 20
                          height: baseSize.height)
        }
    }
    
    init(_ style: ButtonStyle = .primary) {
        super.init(frame: .zero)
        self.style = style
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        layer.cornerRadius = 8
        applyStyle()
    }
    
    func applyStyle() {
        setTitleColor(style.textColor, for: .normal)
        backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
    }
    
    func setEnabled() {
        backgroundColor = isEnabled ? style.backgroundColor : .clear
    }

}
