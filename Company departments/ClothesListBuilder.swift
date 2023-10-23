//
//  ClothesListBuilder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 08.12.2022.
//

import UIKit

class ClothesListBuilder {
    
//    let clothesListId: UUID
//
//    init(clothesListId: UUID) {
//        self.clothesListId = clothesListId
//    }
    
    let delegate: ClothesListPresenterDelegate
    
    init(delegate: ClothesListPresenterDelegate) {
        self.delegate = delegate
    }
    
    func build() -> UIViewController {
        let presenter = ClothesListPresenter()
        let view = ClothesListViewController(presenter: presenter)
        presenter.view = view
        presenter.delegate = delegate
//        presenter.clothesListId = clothesListId
        return view
    }
}
