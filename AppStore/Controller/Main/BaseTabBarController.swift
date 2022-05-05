//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Nii Yemoh on 12/04/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    
    func setupChildViewControllers(){
        setViewControllers(
            [
                createNavController(forViewController: TodayCollectionViewController(), withTitle: "Today", andImageName: "today_icon"),
                createNavController(forViewController: AppsPageCollectionViewController(), withTitle: "Apps", andImageName: "apps"),
                createNavController(forViewController: SearchCollectionViewController(), withTitle: "Search", andImageName: "search")
            ], animated: true)
    }
    
    
    fileprivate func createNavController(forViewController viewController: UIViewController,
                                         withTitle title: String,
                                         andImageName imageName: String ) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.tabBarItem.title = title
        return navigationController
    }
    
    
    
    
}
