//
//  ClothesListProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import Foundation

protocol ClothesListViewProtocol: AnyObject {
    func reloadData()
    func insert(rows: [IndexPath])
    func delete(rows: [IndexPath])
}

protocol ClothesListPresenterProtocol {
    func prepareData()
    func didSelectClothes(indexPath: IndexPath)
}


protocol MenuDataProtocol {
    var numberOfSections: Int {get}
    func numberOfRowsInSection(section: Int) -> Int
    func nameOfHeaderSection(section: Int) -> String
    func expandSection(section: Int) -> Bool
    func getSectionViewModel(section: Int) -> ClothesMenu
    func getViewModel(for indexPath: IndexPath) -> CellViewModel
    func moveSection(fromIndex: IndexPath, toIndex: IndexPath)
}
