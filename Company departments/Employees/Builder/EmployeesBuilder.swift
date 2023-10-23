//
//  EmployeesBuilder.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.07.2022.
//

import UIKit


class EmployeeBuilder {
    
    let employeeArray: [EmployeeModel]
    let departmentId: UUID
    let delegete: EmployeesPresenterDelegete
    
    init(employeeArray: [EmployeeModel], departmentId: UUID, delegete: EmployeesPresenterDelegete) {
        self.employeeArray = employeeArray
        self.departmentId = departmentId
        self.delegete = delegete
    }
    
    func build() -> UIViewController {
        let presenter = EmployeesPresenter()
        let view = EmployeesViewController(presenter)
        presenter.view = view
        presenter.employeeData = employeeArray
        presenter.departmentId = departmentId
        presenter.delegte = delegete
        return view
    }
}
