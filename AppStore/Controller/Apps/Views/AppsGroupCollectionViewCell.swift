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
        label.font = .systemFont(ofSize: 28, weight: .medium)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(horizontalController.view)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
    }
    
    
    
    
    
}
