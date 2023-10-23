//
//  CreateDepartmentPresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//

import Foundation

protocol CreateDepartmentPresenterDelegate: AnyObject {
    func didCreateDepartment(_ department: DepartmentModel)
}

class CreateDepartmentPresenter {
    
    weak var view: CreateDepartmentInput?
    
    weak var delegate: CreateDepartmentPresenterDelegate?
    
    func createDepartment(_ text: String) {
        let hasText = !text.isEmpty
        guard hasText else { return }
        
        let department = DepartmentModel(name: text)
        delegate?.didCreateDepartment(department)
    }
}

extension CreateDepartmentPresenter: CreateDepartmentOutput {
    
    func viewDidLoad() {
    }
    
    func didTapCreateButton(text: String) {
//        let department = DepartmentModel(name: text)
        createDepartment(text)
    }
}
