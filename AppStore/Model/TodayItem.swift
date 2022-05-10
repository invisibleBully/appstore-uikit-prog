//
//  TodayItem.swift
//  AppStore
//
//  Created by Nii Yemoh on 06/05/2022.
//

import Foundation
import UIKit


enum CellType: String {
    case single, multiple
}

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let desc: String
    let backgroundColor: UIColor
    let cellType: CellType
}
