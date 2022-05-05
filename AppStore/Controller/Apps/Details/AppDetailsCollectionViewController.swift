//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Nii Yemoh on 28/04/2022.
//

import Foundation
import UIKit


class AppDetailsCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet{
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            NetworkManager.shared.makeRequest(urlString: urlString) { [weak self] (result: SearchResultResponse?, err) in
                self?.app = result?.results.first
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Result?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCollectionViewCell.self, forCellWithReuseIdentifier: AppDetailCollectionViewCell.identifier)
        collectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: PreviewCollectionViewCell.identifier)
        collectionView.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: ReviewCollectionViewCell.identifier)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCollectionViewCell.identifier, for: indexPath) as? AppDetailCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(app: app)
            return cell
        }else if indexPath.item == 1{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionViewCell.identifier, for: indexPath) as? PreviewCollectionViewCell else { return UICollectionViewCell() }
            cell.horizontalController.app = app
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier, for: indexPath) as? ReviewCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            //calculate the necessary size for our cell somehow
            let dummyCell = AppDetailCollectionViewCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.configureCell(app: app)
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return .init(width: view.frame.width, height: estimatedSize.height)
        }else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 500)
        }else {
            return .init(width: view.frame.width, height: 280)
        }
        
        
    }
    
    
    
}
