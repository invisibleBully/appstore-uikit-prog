//
//  FullScreenDescriptionTableViewCell.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation
import UIKit




class FullScreenDescriptionTableViewCell: UITableViewCell {
    
    
    static let identifier = "FullScreenDescriptionTableViewCell"
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Great games",
                                                       attributes: [.foregroundColor:UIColor.black])
        
        attributedText.append(NSAttributedString(string: " are all about the details, from subtle visual effects, you're sure to find something to marvel at, whether you're into fantasy worldsor neon-soaked dartboards",
                                                 attributes: [.foregroundColor:UIColor.gray]))
        
        
        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure",
                                                 attributes: [.foregroundColor:UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", attributes: [.foregroundColor:UIColor.gray]))
        
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.attributedText = attributedText
        
        
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
