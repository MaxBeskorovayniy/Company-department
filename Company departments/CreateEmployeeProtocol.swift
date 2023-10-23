//
//  EmploeeProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 06.07.2022.
//

import Foundation

protocol CreateEmployeeViewConntrollerOutput {
    func viewDidLoad()
    func createEmploeeButton(text: String)
}

protocol CreateEmployeeViewInput: AnyObject {
}
