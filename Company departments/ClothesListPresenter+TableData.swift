//
//  ClothesListPresenter+TableData.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import UIKit

extension ClothesListPresenter: MenuDataProtocol {
    var numberOfSections: Int {
        return data.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        let section = data[section] as! ClothesMenu
        if section.expandable == true {
            return section.clothesName.count
        } else {
            return 0
        }
    }
    
    func getSectionViewModel(section: Int) -> ClothesMenu {
        return data[section] as! ClothesMenu
    }
    
    func nameOfHeaderSection(section: Int) -> String {
        let section = data[section] as! ClothesMenu
        return section.header
    }
    
    func getViewModel(for indexPath: IndexPath) -> CellViewModel {
        let section = data[indexPath.section] as! ClothesMenu
        let row = section.clothesName[indexPath.row]
        return row
    }
    
    func expandSection(section: Int) -> Bool {
        let sectionModel = data[section] as! ClothesMenu
        sectionModel.expandable.toggle()
        
        let rows = sectionModel.clothesName.enumerated().compactMap({ IndexPath(row: $0.offset, section: section) })
        if sectionModel.expandable {
            view?.insert(rows: rows)
        } else {
            view?.delete(rows: rows)
        }
        
        return sectionModel.expandable
    }
    
    func moveSection(fromIndex: IndexPath, toIndex: IndexPath) {
        let toSection = data[toIndex.section] as! ClothesMenu
        let section = data[fromIndex.section] as! ClothesMenu
        
        let row = section.clothesName[fromIndex.row]
        section.clothesName.remove(at: fromIndex.row)
        
        toSection.clothesName.insert(row, at: toIndex.row)
    }
}
