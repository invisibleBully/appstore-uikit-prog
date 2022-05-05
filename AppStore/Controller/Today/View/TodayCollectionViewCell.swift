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
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "garden"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16.0
        clipsToBounds = true
        addSubview(imageView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    
    
    
}
