//
//  FullScreenHeaderCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation
import UIKit



class FullScreenHeaderCell: UITableViewCell {
    
    
    static let identifier = "FullScreenHeaderCell"
    let todayCell = TodayCollectionViewCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "cancel"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(todayCell)
        addSubview(closeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        todayCell.fillSuperview()
        closeButton.anchor(top: topAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: trailingAnchor,
                           padding: .init(top: 44, left: 0, bottom: 0, right: 24),
                           size: .init(width: 32,
                                       height: 32))
    }
    
}
