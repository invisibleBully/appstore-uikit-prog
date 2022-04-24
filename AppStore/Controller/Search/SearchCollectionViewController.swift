//
//  SearchCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 18/04/2022.
//

import UIKit


class SearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate var appResults: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchCollectionViewCell.cellIdentifier)
        fetchItunesApps()
    }
    
    
    
    
    init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    fileprivate func fetchItunesApps(){
        
        NetworkManager.shared.fetchApps(completion: { [weak self] (results, error)  in
            guard let self = self else { return }
            if let error = error { print("Error fetching data", error); return }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        let result = appResults[indexPath.item]
        cell.configureCell(forApp: result)
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    
    
}
