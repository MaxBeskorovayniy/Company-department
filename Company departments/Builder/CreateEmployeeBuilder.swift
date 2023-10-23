//
//  EmploeeBuilder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 06.07.2022.
//

import Foundation
import UIKit

class CreateEmployeeBuilder {
    
    let delegate: CreateEmployeePresenterDelegate?
    var departmentId: UUID
    
    init(delegate: CreateEmployeePresenterDelegate?, departmentId: UUID) {
        self.delegate = delegate
        self.departmentId = departmentId
    }
    
    func build() -> UIViewController {
        let presenter = CreateEmployeePresenter()
        let view = CreateEmployeeViewConntroller(presenter)
        presenter.view = view
        presenter.departmentId = departmentId
        presenter.employeeDelegate = delegate
        return view
    }
}
