//
//  BaseListController.swift
//  AppStore
//
//  Created by Nii Yemoh on 24/04/2022.
//

import Foundation
import UIKit

class BaseListController: UICollectionViewController {
    
    init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
