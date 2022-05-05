//
//  ReviewCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 04/05/2022.
//

import Foundation
import UIKit



class ReviewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCollectionViewCell"
    let horizontalController = ReviewCollectionViewController()
    
    lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Reviews & Ratings"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(reviewLabel)
        addSubview(horizontalController.view)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reviewLabel.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: nil,
                           trailing: trailingAnchor,
                           padding: .init(top: 20,
                                          left: 20,
                                          bottom: 0,
                                          right: 0))
        
        horizontalController.view.anchor(top: reviewLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor,
                                         padding: .init(top: 20,
                                                        left: 0,
                                                        bottom: 20,
                                                        right: 0))
    }
    
    
}
