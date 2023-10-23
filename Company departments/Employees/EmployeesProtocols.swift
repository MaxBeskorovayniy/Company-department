//
//  EmployeeProtocols.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.07.2022.
//

import Foundation

protocol EmployeesViewControllerOutput {
    func viewDidLoad()
}

protocol EmployeesViewControllerInput: AnyObject {
    func deliteEmployeeViewController(indexPath: IndexPath)
}
