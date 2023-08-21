//
//  WelcomeScreenViewController.swift
//  LoopPlace
//
//

import UIKit
import SwiftUI

class WelcomeScreenViewController: UIViewController {
    
    //MARK: - Properties
    private let marketplaceImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.backgroundColor = .clear
        return profileImageView
    }()
    
    private let welcomeLabel = UILabel.label(text: "Placeholder",
                                             font: .systemFont(ofSize: 34, weight: .bold),
                                             lineHeightMultiple: 1.01,
                                             kern: 0.5,
                                             textColor: .labelPrimary,
                                             accessibilityIdentifier: "welcomeLabel")
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
