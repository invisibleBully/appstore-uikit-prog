//
//  MultipleAppCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 07/05/2022.
//

import Foundation
import UIKit


class MultipleAppCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MultipleAppCollectionCell"
    
    
    let multipleAppsController = UIViewController()
    
    
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "PidiDip"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "I'll risk it for more than a biscuit"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, multipleAppsController.view])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        multipleAppsController.view.backgroundColor = .red
        addSubview(stackView)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.fillSuperview(padding: .init(top: 24,
                                               left: 24,
                                               bottom: 24,
                                               right: 24))
    }
    
    
    
    
    func configureCell(for item: TodayItem){
        categoryLabel.text = item.category
        titleLabel.text = item.title
    }
    
    
}
