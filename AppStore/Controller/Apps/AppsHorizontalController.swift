//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Nii Yemoh on 24/04/2022.
//

import Foundation
import UIKit


class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    var appGroups: AppGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: AppsRowCell.identifier)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups?.feed.results.count ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsRowCell.identifier,
                                                            for: indexPath) as? AppsRowCell else {
            
            return UICollectionViewCell()
        }
        
        if let feedResult = appGroups?.feed.results[indexPath.row] {
            cell.configureCell(forResult: feedResult)
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.height - 44) / 3 //12 12 10 10
        return .init(width: view.frame.width - 48, height: height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    
    
    
    
}
