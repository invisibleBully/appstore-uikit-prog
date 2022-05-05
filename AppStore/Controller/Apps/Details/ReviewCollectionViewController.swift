//
//  ReviewCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 04/05/2022.
//

import Foundation
import UIKit



class ReviewCollectionViewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(RatingCollectionViewCell.self, forCellWithReuseIdentifier: RatingCollectionViewCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCollectionViewCell.identifier, for: indexPath) as?
                RatingCollectionViewCell else {
                    return UICollectionViewCell()
                }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    
}
