//
//  HorizontalSnappingController.swift
//  AppStore
//
//  Created by Nii Yemoh on 28/04/2022.
//

import Foundation
import UIKit




class HorizontalSnappingController: UICollectionViewController {
    
    
    init(){
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




