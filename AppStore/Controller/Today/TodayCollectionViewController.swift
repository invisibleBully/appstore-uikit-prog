//
//  TodayCollectionViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation
import UIKit



class TodayCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    var startingFrame: CGRect?
    var fullScreenController: AppFullScreenTableViewController!
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    
    let items: [TodayItem] = [
        .init(category: "LIFE HACK",
              title: "Utilizing your time",
              image: UIImage(named: "garden")!,
              desc: "All the tools and apps you need to intelligently organize your life the right way",
              backgroundColor: UIColor.white, cellType: .single),
        .init(category: "THE DAILY LIST",
              title: "Test Drive These carPlay Apps",
              image: UIImage(named: "garden")!,
              desc: "",
              backgroundColor: UIColor.white, cellType: .multiple),
        .init(category: "HEALTH",
              title: "Free Health Care",
              image: UIImage(named: "garden")!,
              desc: "All the tools and apps you need to intelligently organize your life the right way",
              backgroundColor: UIColor.white, cellType: .single),
        .init(category: "FINANCE",
              title: "Everyday finances",
              image: UIImage(named: "garden")!,
              desc: "All the tools and apps you need to intelligently organize your life the right way",
              backgroundColor: UIColor.white, cellType: .single)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = UIColor.init(white: 0.5, alpha: 0.1)
        collectionView.register(TodayCollectionViewCell.self,
                                forCellWithReuseIdentifier: CellType.single.rawValue)
        collectionView.register(MultipleAppCollectionViewCell.self,
                                forCellWithReuseIdentifier: CellType.multiple.rawValue)
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.row]
        
        let cellType = item.cellType
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: indexPath)
        
        switch cellType {
        case .single:
            let cell = cell as! TodayCollectionViewCell
            cell.configureCell(item: item)
            return cell
        case .multiple:
            let cell = cell as! MultipleAppCollectionViewCell
            cell.configureCell(for: item)
            return cell
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //animate full screen somehow
        
        let fullScreenController = AppFullScreenTableViewController()
        fullScreenController.todayItem = items[indexPath.row]
        fullScreenController.dismissHandler = {
            self.handleRemoveAnimatedView()
        }
        let fullScreenView = fullScreenController.view!
        fullScreenView.layer.cornerRadius = 16
        //        fullScreenView.addGestureRecognizer(UITapGestureRecognizer(target: self,
        //                                                                   action: #selector(handleRemoveAnimatedView)))
        //
        view.addSubview(fullScreenView)
        addChild(fullScreenController)
        
        self.fullScreenController = fullScreenController
        
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return } //aboslute cordinate of cell
        
        
        self.startingFrame = startingFrame
        //fullScreenView.frame = startingFrame
        
        //autolayout constraint animations
        //4 anchors
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint  = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        NSLayoutConstraint.activate([
            topConstraint!,
            leadingConstraint!,
            widthConstraint!,
            heightConstraint!
        ])
        self.view.layoutIfNeeded()
        //why transition delegates?
        //we're using frames for animation
        //frames aren't reliable for animation
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: {
            //fullScreenView.frame = self.view.frame
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            //self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
            
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0,0]) as? FullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
        },
                       completion: nil)
    }
    
    
    
    @objc func handleRemoveAnimatedView(){
        //access starting frame
        //gesture.view?.removeFromSuperview()
        //self.navigationController?.navigationBar.isHidden = false
        self.fullScreenController.tableView.contentOffset = .zero
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: {
            
            self.topConstraint?.constant = self.startingFrame?.origin.y ?? .zero
            self.leadingConstraint?.constant = self.startingFrame?.origin.x ?? .zero
            self.widthConstraint?.constant = self.startingFrame?.width ?? .zero
            self.heightConstraint?.constant = self.startingFrame?.height ?? .zero
            
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.transform = .identity
            
            
            
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0,0]) as? FullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 24
            cell.layoutIfNeeded()
        },
                       completion: { _ in
            
            self.fullScreenController.view.removeFromSuperview()
            self.fullScreenController.removeFromParent()
        })
    }
    
}
