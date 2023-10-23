//
//  Builder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//

import UIKit

class DepartmentBuilder {
    
    func build() -> UIViewController {
        let presenter = DepartmentsPresenter()
        let view = DepartmensViewController(presenter)
        presenter.view = view
        return view
    }
}
