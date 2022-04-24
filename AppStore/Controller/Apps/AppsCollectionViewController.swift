//
//  AppsCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 24/04/2022.
//

import Foundation
import UIKit



class AppsCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        collectionView.register(AppsGroupCollectionViewCell.self,
                                forCellWithReuseIdentifier: AppsGroupCollectionViewCell.identifier)
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCollectionViewCell.identifier, for: indexPath) as? AppsGroupCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    
}





