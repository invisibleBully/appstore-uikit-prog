//
//  AppFullScreenTableViewController.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation
import UIKit




class AppFullScreenTableViewController: UITableViewController {
    
    var dismissHandler: (() -> ())?
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = FullScreenHeaderCell()
            cell.closeButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
            cell.selectionStyle = .none
            if let todayItem = todayItem {
                cell.todayCell.configureCell(item: todayItem)
            }
            cell.todayCell.layer.cornerRadius = 0
            return cell
        }
        let cell =  FullScreenDescriptionTableViewCell()
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 500 } else { return UITableView.automaticDimension }
    }
    
    
    
    @objc func dismissController(button: UIButton){
        button.isHidden = true
        dismissHandler?()
    }
    
    
}
