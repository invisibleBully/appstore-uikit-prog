//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation
import UIKit



class TodayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TodayCollectionViewCell"
    var topConstraint: NSLayoutConstraint!
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "garden"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 3
        return label
    }()
    
    
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            categoryLabel,
            titleLabel,
            containerView,
            descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16.0
        clipsToBounds = true
        containerView.addSubview(imageView)
        addSubview(stackView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
//        stackView.fillSuperview(padding: .init(top: 24,
//                                               left: 24,
//                                               bottom: 24,
//                                               right: 24))
        stackView.anchor(top: nil,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         padding: .init(top: 0,
                                        left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint.isActive = true
    }
    
    
    
    func configureCell(item: TodayItem){
        //containerView.backgroundColor = item.backgroundColor
        titleLabel.text = item.title
        categoryLabel.text = item.category
        descriptionLabel.text = item.desc
        imageView.image = item.image
        backgroundColor = item.backgroundColor
    }
    
    
}
