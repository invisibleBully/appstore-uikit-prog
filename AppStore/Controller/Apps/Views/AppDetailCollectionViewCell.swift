//
//  AppDetailCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 03/05/2022.
//

import Foundation
import UIKit


class AppDetailCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "AppDetailCollectionViewCell"
    
    
    
    lazy var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .red
        return imageView
    }()
    
    
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "App Name"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    
    
    lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "App Description"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    
    
    lazy var priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("$4.99", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    
    
    lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "What's New"
        return label
    }()
    
    
    
    lazy var appVersionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "1.09"
        return label
    }()
    
    
    
    
    
    lazy var releaseNoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Release Notes"
        label.numberOfLines = 0
        return label
    }()
    
    
    
    lazy var verticalStackView: UIStackView  = {
        let stackView = UIStackView(arrangedSubviews: [appDataStackView, whatsNewLabel, releaseNoteLabel])
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    
    lazy var appDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView])
        stackView.spacing = 12
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appNameLabel, appDescriptionLabel, priceButton])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(verticalStackView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        verticalStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        priceButton.constrainWidth(constant: 80)
        priceButton.constrainHeight(constant: 32)
    }
    
    
    
}
