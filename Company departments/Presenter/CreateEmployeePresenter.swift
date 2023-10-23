//
//  EmploeePresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 06.07.2022.
//

import Foundation

protocol CreateEmployeePresenterDelegate: AnyObject {
    func didCreateEmployee(_ employee: EmployeeModel, departmentId: UUID)
}

class CreateEmployeePresenter {
    
    weak var view: CreateEmployeeViewInput?
    
    weak var employeeDelegate: CreateEmployeePresenterDelegate?
    
    var departmentId: UUID?
    
    func createEmployee(_ text: String, _ id: UUID) {
        let employee = EmployeeModel(name: text)
        if text.isEmpty{
            print("Employee text is empty")
        } else {
            employeeDelegate?.didCreateEmployee(employee, departmentId: id)
        }
    }
}

extension CreateEmployeePresenter: CreateEmployeeViewConntrollerOutput {

    func createEmploeeButton(text: String) {
        guard let id = departmentId else { return }
        createEmployee(text, id)
    }
    
    func viewDidLoad() {
    }
}
