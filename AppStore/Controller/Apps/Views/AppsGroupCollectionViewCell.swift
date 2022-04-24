//
//  AppsGroupCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 24/04/2022.
//

import UIKit

class AppsGroupCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AppsGroupCollectionViewCell"
    let horizontalController = AppsHorizontalController()
    
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
    }
    
    
    
    
    
}
