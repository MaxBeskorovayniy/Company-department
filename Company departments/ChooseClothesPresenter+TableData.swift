//
//  ChooseClothesPresenter+TableData.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import Foundation

extension ChooseClothesPresenter: TabelDataProtocol {
    
    var numberOfRows: Int {
        return data.count
    }
    
    func getViewModel(for indexPath: IndexPath) -> CellViewModel {
        return data[indexPath.row]
    }
}
