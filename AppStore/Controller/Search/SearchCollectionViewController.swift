//
//  SearchCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 18/04/2022.
//

import UIKit


class SearchCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate var appResults: [Result] = []
    let searchController = UISearchController(searchResultsController: nil)
    var timer: Timer?
    
    
    
    private lazy var enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchCollectionViewCell.cellIdentifier)
        //fetchItunesApps()
        setupSearchBar()
        collectionView.addSubview(enterSearchTermLabel)
    }
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
    }
    
    
    
    
    fileprivate func fetchItunesApps(){
        NetworkManager.shared.fetchApps(searchTerm: "Twitter", completion: { [weak self] (results, error)  in
            guard let self = self else { return }
            if let error = error { print("Error fetching data", error); return }
            self.appResults = results?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    
    fileprivate func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchTermLabel.isHidden = appResults.count != 0
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
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appId = appResults[indexPath.item].trackId
        let appDetailController  = AppDetailsCollectionViewController(appId: String(appId))
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    
    
}


extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //introduce delay
        //throttling
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            //fire search
            NetworkManager.shared.fetchApps(searchTerm: searchText) { [weak self] results, error in
                if let error = error {
                    print("Something happened...\(error)")
                    return
                }
                self?.appResults = results?.results ?? []
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        })
        
        
    }
    
    
}
