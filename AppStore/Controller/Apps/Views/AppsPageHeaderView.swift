//
//  AppsPageHeaderView.swift
//  AppStore
//
//  Created by Nii Yemoh on 25/04/2022.
//

import Foundation
import UIKit


class AppsPageHeaderView: UICollectionReusableView {
    
    
    let appHeaderHorizontalController = AppsHeaderHorizontalCollectionViewController()
    static let identifier = "AppsPageHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appHeaderHorizontalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizontalController.view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
