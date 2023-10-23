//
//  ChooseClothesPresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import Foundation

class ChooseClothesPresenter {
    
    weak var view: ChooseClothesViewProtocol?
        
    var data = [CellViewModel]()
}

extension ChooseClothesPresenter: ClothesListPresenterDelegate {
    func selectedClothes(_ headerTitle: String, _ clothesTitle: String) {
        data.append(ChooseClothesSelectedCell.ViewModel(title: headerTitle, subTitle: clothesTitle))
        view?.reloadData()
    }
    
    
}
