//
//  ChooseClothesProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import Foundation

protocol ChooseClothesViewProtocol: AnyObject {
    func showClothesList()
    func reloadData()
}

protocol ChooseClothesPresenterProtocol {
    func prepareData()
    func showList(index: IndexPath)
}
