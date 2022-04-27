//
//  AppsCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 24/04/2022.
//

import Foundation
import UIKit



class AppsPageCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    let headerId = "id"
    var groups = [AppGroup]()
    var socialApps = [Social]()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.color = .blue
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsGroupCollectionViewCell.self,
                                forCellWithReuseIdentifier: AppsGroupCollectionViewCell.identifier)
        collectionView.register(AppsPageHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AppsPageHeaderView.identifier)
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        fetchData()
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCollectionViewCell.identifier,
                                                            for: indexPath) as? AppsGroupCollectionViewCell else { return UICollectionViewCell() }
        
        let group = groups[indexPath.item]
        
        cell.titleLabel.text = group.feed.title
        cell.horizontalController.appGroups = group
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 16)
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: AppsPageHeaderView.identifier,
                                                                           for: indexPath) as? AppsPageHeaderView else { return UICollectionReusableView() }
        header.appHeaderHorizontalController.socialsApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        
        return header
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    
    fileprivate func fetchData(){
        
        let dispatchGroup = DispatchGroup()
        var group1: AppGroup?
        var group2: AppGroup?
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopFree(completion:  { appGroup,error in
            dispatchGroup.leave()
            if let _ = error {
                return
            }
            group1 = appGroup
        })
        
        
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopPaid { appGroup, error in
            
            dispatchGroup.leave()
            if let _ = error {
                return
            }
            group2 = appGroup
        }
        
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchSocialApps { [weak self] socials, error in
            
            dispatchGroup.leave()
            if let _ = error {
                //display error message
                return
            }
            
            self?.socialApps = socials ?? []
            
        }
        
        
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            
            self?.activityIndicator.stopAnimating()
            
            if let group = group1 {
                self?.groups.append(group)
            }
            
            if let group = group2 {
                self?.groups.append(group)
            }
            
            self?.collectionView.reloadData()
            
        }
        
        
    }
    

    
}





