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
        
        let todayController = UIViewController()
        todayController.view.backgroundColor = .white
        todayController.title = "Today"
        
        let appsController = UIViewController()
        appsController.view.backgroundColor = .white
        appsController.title = "Apps"
        
        let searchController = UIViewController()
        searchController.view.backgroundColor = .white
        searchController.title = "Search"
        
        todayController.navigationItem.largeTitleDisplayMode = .always
        appsController.navigationItem.largeTitleDisplayMode = .always
        searchController.navigationItem.largeTitleDisplayMode = .always
        
        
        let todayNavigationController = UINavigationController(rootViewController: todayController)
        let appsNavigationController = UINavigationController(rootViewController: appsController)
        let searchNavigationController = UINavigationController(rootViewController: searchController)
        
        todayNavigationController.navigationBar.prefersLargeTitles = true
        appsNavigationController.navigationBar.prefersLargeTitles = true
        searchNavigationController.navigationBar.prefersLargeTitles = true
        
        
        todayNavigationController.tabBarItem.title = "Today"
        appsNavigationController.tabBarItem.title = "Apps"
        searchNavigationController.tabBarItem.title = "Search"
        
        
        todayNavigationController.tabBarItem.image = UIImage(named: "today_icon")
        appsNavigationController.tabBarItem.image = UIImage(named: "apps")
        searchNavigationController.tabBarItem.image = UIImage(named: "search")
        
        
        
        setViewControllers(
            [
                todayNavigationController,
                appsNavigationController,
                searchNavigationController
            ], animated: true)
    }
    
    
    
    
    
    
    
}
