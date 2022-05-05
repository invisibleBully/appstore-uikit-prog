//
//  File.swift
//  AppStore
//
//  Created by Nii Yemoh on 03/05/2022.
//

import Foundation
import UIKit
import SDWebImage



class ScreenshotCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "ScreenshotCollectionViewCell"
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 0.15
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.fillSuperview()
    }
    
    
    func configureCell(url: String){
        imageView.sd_setImage(with: URL(string: url), completed: nil)
    }
    
}
