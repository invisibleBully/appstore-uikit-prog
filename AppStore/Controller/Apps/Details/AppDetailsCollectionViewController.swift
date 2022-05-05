//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Nii Yemoh on 28/04/2022.
//

import Foundation
import UIKit


class AppDetailsCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    //identify dependency + dependency injection constructor
    //dependency
    fileprivate let appId: String
    
    var app: Result?
    var reviews: Review?
    
    
    init(appId: String) {
        self.appId = appId
        super.init()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        fetchData()
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
            cell.horizontalController.reviews = reviews
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
    
    
    
    
    
    fileprivate func fetchData(){
        let dispatchGroup = DispatchGroup()
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        
        
        dispatchGroup.enter()
        NetworkManager.shared.makeRequest(urlString: urlString) { [weak self] (result: SearchResultResponse?, err) in
            
            dispatchGroup.leave()
            if let err = err {
                print("failed to decode JSON:", err.localizedDescription)
                return
            }
            self?.app = result?.results.first
        }
        
        let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?1=en&cc=us"
        
        dispatchGroup.enter()
        NetworkManager.shared.makeRequest(urlString: reviewsUrl) { [weak self] (result: Review?, error) in
            
            dispatchGroup.leave()
            if let error = error {
                print("failed to decode JSON:", error)
                return
            }
            self?.reviews  = result
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    
    
}
