//
//  ChooseClothesViewController+TableData.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import UIKit

extension ChooseClothesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = presenter.getViewModel(for: indexPath)
        
        switch model {
           case let viewModel as ChooseClothesDescriptionCell.ViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: ChooseClothesDescriptionCell.className, for: indexPath) as! ChooseClothesDescriptionCell
            return cell.fill(viewModel)
        case let viewModel as ChooseClothesSelectedCell.ViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: ChooseClothesSelectedCell.className, for: indexPath) as! ChooseClothesSelectedCell
            return cell.fill(viewModel)
            
            
        default: return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        presenter.showList(index: indexPath)
//    }
}
