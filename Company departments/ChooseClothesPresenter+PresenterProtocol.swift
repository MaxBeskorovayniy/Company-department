//
//  ChooseClothesPresenter+PrepareData.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import Foundation

extension ChooseClothesPresenter: ChooseClothesPresenterProtocol {
 
    func prepareData() {
        
        let title = ChooseClothesDescriptionCell.ViewModel(title: "Choose your clothes for today")
        data.append(title)
        
//        let titleLabelCell = ChooseClothesSelectedCell.ViewModel(title: "Jecket", subTitle: "jecket", id: UUID())
//        data.append(titleLabelCell)
    }
    
    
    
    func showList(index: IndexPath) {
//        guard let item = data[index.row] as? ChooseClothesSelectedCell.ViewModel else { return }
//        view?.showClothesList()
    }
}
