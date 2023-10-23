//
//  StarRatingBuilder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.01.2023.
//

import UIKit

class StarRatingBuilder {
    
    func build() -> UIViewController {
        let presenter = StarRatingPresenter()
        let view = StarRatingViewController(presenter)
        presenter.view = view
        return view
    }
}
