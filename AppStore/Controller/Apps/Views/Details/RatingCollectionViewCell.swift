//
//  RatingCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 04/05/2022.
//

import Foundation
import UIKit




class RatingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RatingCollectionViewCell"
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Review Subject"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Author Name"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    
    
    lazy var starsLabel: UILabel = {
        let label = UILabel()
        label.text = "Stars"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Review Body"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 5
        return label
    }()
    
    
    
    lazy var starStackView: UIStackView = {
        var arrangedSubViews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(image: UIImage(named: "star"))
            imageView.constrainWidth(constant: 16)
            imageView.constrainHeight(constant: 16)
            arrangedSubViews.append(imageView)
        }
        arrangedSubViews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        stackView.axis  = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelStackView, starStackView, bodyLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        return stackView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(white: 0.8, alpha: 0.3)
        layer.cornerRadius = 16
        clipsToBounds = true
        addSubview(stackView)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 12, bottom: 5, right: 12))
    }
    
    
    func configureCell(entry: Entry){
        titleLabel.text = entry.title.label
        authorLabel.text = entry.author.name.label
        bodyLabel.text = entry.content.label
        
        for (index, view) in starStackView.arrangedSubviews.enumerated() {
            if let ratingInt = Int(entry.rating.label) {
                view.alpha = index >= ratingInt ? 0 : 1
            }
        }
    }
    
    
}
