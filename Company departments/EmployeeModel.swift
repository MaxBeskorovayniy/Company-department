//
//  EmployeeModel.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 06.07.2022.
//

import Foundation

class EmployeeModel {
    
    let id = UUID()
    let employee: String
    
    init(name: String) {
        self.employee = name
    }
}
