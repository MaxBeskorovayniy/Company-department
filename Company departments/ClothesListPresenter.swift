//
//  ClothesListPresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import Foundation

protocol ClothesListPresenterDelegate: AnyObject {
    func selectedClothes(_ headerTitle: String, _ ClothesTitle: String)
}

class ClothesListPresenter {
    
    weak var view: ClothesListViewProtocol?
    
    var clothesListId: UUID?
    
    var data = [CellViewModel]()
    
    weak var delegate: ClothesListPresenterDelegate?
    
    func selectClothes(headerText: String, clothesName: String) {
        delegate?.selectedClothes(headerText, clothesName)
    }
}



