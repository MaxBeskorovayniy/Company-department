//
//  Protocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//

import Foundation

protocol DepartmentsViewOutput {
    func viewDidLoad()
    func didSelect(indexPath: IndexPath)
}

protocol DepartmensViewInput: AnyObject {
    func reloadData()
    func openEmployeScreen(_ delegate: CreateEmployeePresenterDelegate, departmentId: UUID)
    func showEmployee(employeesArray: [EmployeeModel], departmentId: UUID, delegete: EmployeesPresenterDelegete)
    func openDocumentPhoto()
}
