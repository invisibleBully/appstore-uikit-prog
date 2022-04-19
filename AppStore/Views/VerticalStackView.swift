//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Nii Yemoh on 19/04/2022.
//

import UIKit

class VerticalStackView: UIStackView {
    
    
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
