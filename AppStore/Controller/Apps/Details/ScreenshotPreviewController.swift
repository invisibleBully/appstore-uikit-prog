//
//  ScreenshotPreviewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 03/05/2022.
//

import Foundation
import UIKit


class ScreenshotPreviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: ScreenshotCollectionViewCell.identifier)
        collectionView.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let app = app {
            return app.screenshotUrls.count
        }
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCollectionViewCell.identifier, for: indexPath) as? ScreenshotCollectionViewCell else { return UICollectionViewCell() }
        if let app = app {
            cell.configureCell(url: app.screenshotUrls[indexPath.row])
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
    
}
