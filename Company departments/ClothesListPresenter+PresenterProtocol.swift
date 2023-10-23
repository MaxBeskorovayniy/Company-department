//
//  ClothesListPresenter+PresenterProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import Foundation

extension ClothesListPresenter: ClothesListPresenterProtocol {
    
    func prepareData() {
                
        let title = ClothesListCell.ViewModel(title: "Пуховик")
        let title1 = ClothesListCell.ViewModel(title: "Куртка")
        let title2 = ClothesListCell.ViewModel(title: "Пальто")
        let title3 = ClothesListCell.ViewModel(title: "Джемпер")
        let title4 = ClothesListCell.ViewModel(title: "Черная")
        let title5 = ClothesListCell.ViewModel(title: "Белая")
        let title6 = ClothesListCell.ViewModel(title: "Красная")
        let title7 = ClothesListCell.ViewModel(title: "Синяя")
        let title8 = ClothesListCell.ViewModel(title: "Фиолетовая")
        let title9 = ClothesListCell.ViewModel(title: "Белые")
        let title10 = ClothesListCell.ViewModel(title: "Коричневые")
        let title11 = ClothesListCell.ViewModel(title: "Ченые")
        let title12 = ClothesListCell.ViewModel(title: "Синие")
      
        data.append(ClothesMenu(header: "Верхняя одежда", clothesName: [title, title1, title2, title3], expandable: true))
        data.append(ClothesMenu(header: "Рубашки", clothesName: [title4, title5, title6,title7, title8], expandable: true))
        data.append(ClothesMenu(header: "Джинсы", clothesName: [title9, title10, title11, title12 ], expandable: true))
    }
    
    func didSelectClothes(indexPath: IndexPath) {
        let section = data[indexPath.section] as! ClothesMenu
        let headerText = section.header
        let clothesTitle = section.clothesName[indexPath.row].title ?? "не выбрано"
        selectClothes(headerText: headerText, clothesName: clothesTitle)
    }
}
