//
//  SearchCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 18/04/2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SearchCollectionViewCell"
    
    
    private lazy var screenShotImageViewOne = createScreenshotImageView()
    private lazy var screenShotImageViewTwo = createScreenshotImageView()
    private lazy var screenShotImageViewThree = createScreenshotImageView()
    
    
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageView
    }()
    
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Videos"
        return label
    }()
    
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 15.0
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appInfoStackView, screenshotStackView])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    
    
    private lazy var appInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appImageView,
                                                       labelStackView,
                                                       getButton]
        )
        stackView.spacing = 12
        stackView.alignment = .center
        return stackView
    }()
    
    
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    
    
    private lazy var screenshotStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [screenShotImageViewOne, screenShotImageViewTwo, screenShotImageViewThree])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(parentStackView)
        setupStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    
    
    
    private func setupStackView(){
        parentStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    
    
    
    
}
