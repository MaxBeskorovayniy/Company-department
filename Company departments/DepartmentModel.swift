//
//  DepartmentModel.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//


import UIKit

class DepartmentModel {
    
    let name: String
    let id = UUID()
    
    init(name: String) {
        self.name = name
    }
}
