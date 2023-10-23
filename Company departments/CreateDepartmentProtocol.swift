//
//  CreateDepartmentProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//

import Foundation

protocol CreateDepartmentOutput {
    func viewDidLoad()
    func didTapCreateButton(text: String)
}

protocol CreateDepartmentInput: AnyObject {
}
