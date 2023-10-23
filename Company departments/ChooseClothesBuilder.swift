//
//  ChooseClothesBuilder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import UIKit

class ChooseClothesBuilder {
    
    func build() -> UIViewController {
        let presenter = ChooseClothesPresenter()
        let view = ChooseClothesViewController(presenter)
        presenter.view = view
        return view
    }
}
