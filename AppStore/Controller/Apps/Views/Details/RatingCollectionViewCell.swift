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
        label.text = "Review Subject"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
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
        label.numberOfLines = 0
        return label
    }()
    
    
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel])
        stackView.axis  = .horizontal
        return stackView
    }()
    
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelStackView, starsLabel, bodyLabel])
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
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
