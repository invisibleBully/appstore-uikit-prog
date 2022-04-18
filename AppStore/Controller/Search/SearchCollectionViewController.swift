//
//  SearchCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 18/04/2022.
//

import UIKit


class SearchCollectionViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
    
    
    init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
