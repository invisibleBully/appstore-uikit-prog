//
//  AppsRowCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 25/04/2022.
//

import Foundation
import UIKit

//make convenience init

class AppsRowCell: UICollectionViewCell {
    
    static let identifier = "AppsRowCell"
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    
    
    lazy var companyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    
    lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.setTitle("GET", for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, companyNameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()
    
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        return stackView
    }()
    
    //they require Duolingo Test
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        getButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
    }
    
    
    
    
    
}
