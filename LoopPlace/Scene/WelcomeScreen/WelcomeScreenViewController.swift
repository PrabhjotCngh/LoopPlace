//
//  WelcomeScreenViewController.swift
//  LoopPlace
//
//

import UIKit
import SwiftUI

class WelcomeScreenViewController: UIViewController {
    
    //MARK: - Properties
    
    /// ImageView's
    private let marketplaceImageView: UIImageView = {
        let marketplaceImageView = UIImageView()
        marketplaceImageView.image = UIImage(named: OnboardingViewConstants.Image.marketplace)
        marketplaceImageView.translatesAutoresizingMaskIntoConstraints = false
        marketplaceImageView.backgroundColor = .clear
        return marketplaceImageView
    }()
    
    // Label's
    private let welcomeLabel = UILabel.label(text: OnboardingViewConstants.Text.welcome,
                                             font: .systemFont(ofSize: 22, weight: .regular),
                                             lineHeightMultiple: 1.01,
                                             kern: 0.5,
                                             textAlignment: .center,
                                             textColor: .labelPrimary,
                                             accessibilityIdentifier: "welcomeLabel")
    
    private let marketplaceLabel = UILabel.label(text: OnboardingViewConstants.Text.marketplace,
                                                 font: .systemFont(ofSize: 34, weight: .semibold),
                                                 lineHeightMultiple: 1.01,
                                                 kern: 0.5,
                                                 textAlignment: .center,
                                                 textColor: .labelPrimary,
                                                 accessibilityIdentifier: "marketplaceLabel")
    
    /// Button's
    let nextButton: StyledButton = {
        let nextButton = StyledButton()
        nextButton.style = .primary
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        setupSubviews()
        setupConstraints()
    }
    
    /// Private functions
    private func setupSubviews() {
        view.addSubview(marketplaceLabel)
        view.addSubview(marketplaceImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            marketplaceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            marketplaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            welcomeLabel.topAnchor.constraint(equalTo: marketplaceLabel.bottomAnchor, constant: 16),
            
            marketplaceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            marketplaceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            marketplaceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            marketplaceImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            marketplaceImageView.heightAnchor.constraint(equalToConstant: view.frame.size.height/2.4),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: marketplaceImageView.bottomAnchor, constant: 16),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc private func nextButtonAction(sender: UIButton!) {
        let childView = UIHostingController(rootView: HomeDashBoardView())
        addChild(childView)
        childView.view.frame = view.bounds
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(subview: childView.view)
        childView.didMove(toParent: self)
    }
    
    private func addConstraints(subview: UIView) {
        view.addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: view.topAnchor),
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
