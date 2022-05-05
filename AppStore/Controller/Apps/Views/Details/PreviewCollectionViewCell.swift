//
//  PreviewCollectionViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 03/05/2022.
//

import Foundation
import UIKit



class PreviewCollectionViewCell: UICollectionViewCell {
    
    
    let horizontalController = ScreenshotPreviewController()
    
    static let identifier = "PreviewCollectionViewCell"
    
    
    lazy var previewLabel: UILabel = {
        let label = UILabel()
        label.text = "Preview"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(previewLabel)
        addSubview(horizontalController.view)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: trailingAnchor,
                            padding: .init(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 0))
        
        horizontalController.view.anchor(top: previewLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor,
                                         padding: .init(top: 20,
                                                        left: 0,
                                                        bottom: 0,
                                                        right: 0))
    }
    
}
