//
//  TabelDataProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 12.07.2022.
//

import Foundation

protocol TabelDataProtocol {
    var numberOfRows: Int {get}
    func getViewModel(for indexPath: IndexPath) -> CellViewModel
}
