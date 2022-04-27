//
//  AppsHeaderCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 25/04/2022.
//

import Foundation
import UIKit
import SDWebImage

class AppsHeaderCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "AppsHeaderCollectionViewCell"
    
    
    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Facebook"
        label.textColor = .blue
        return label
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Keeping up with friends is faster than ever"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    
    lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [companyLabel,
                                                       titleLabel,
                                                       bannerImageView])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(app: Social){
        companyLabel.text = app.name
        titleLabel.text = app.tagline
        bannerImageView.sd_setImage(with: URL(string: app.imageUrl), completed: nil)
    }
    
}
