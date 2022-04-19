//
//  SearchCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 18/04/2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SearchCollectionViewCell"
    
    
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
    
    
    
    private lazy var mainStackView: UIStackView = {
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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(mainStackView)
        setupStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupStackView(){
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}
