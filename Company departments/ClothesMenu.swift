//
//  ClothesMenu.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import Foundation

class ClothesMenu: CellViewModel {
    
    var header: String
    var clothesName: [ClothesListCell.ViewModel]
    var expandable: Bool
    
    init(header: String, clothesName: [ClothesListCell.ViewModel], expandable: Bool) {
        self.header = header
        self.clothesName = clothesName
        self.expandable = expandable
    }
    
}

class ClothesNameModel: CellViewModel {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
