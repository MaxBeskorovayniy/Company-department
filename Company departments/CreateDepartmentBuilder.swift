//
//  Builder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//


import UIKit

class CreateDepartmentBuilder {
        
    let delegate: CreateDepartmentPresenterDelegate?

    init(delegate: CreateDepartmentPresenterDelegate?) {
        self.delegate = delegate
    }
    
    func build() -> UIViewController {
        let presenter = CreateDepartmentPresenter()
        let view = CreateDeprtmentViewController(presenter)
        presenter.view = view
        presenter.delegate = delegate
        return view
    }
}
