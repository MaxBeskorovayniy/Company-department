//
//  EmployeesPresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.07.2022.
//

import Foundation

protocol EmployeesPresenterDelegete {
    func deleteEmployee (employeeId: UUID, departmentId: UUID)
}

class EmployeesPresenter {
    
    weak var view: EmployeesViewControllerInput?
    var data = [CellViewModel]()
    var employeeData = [EmployeeModel]()
    var departmentId: UUID?
    var delegte: EmployeesPresenterDelegete?
 
}

extension EmployeesPresenter: EmployeesViewControllerOutput {
    
    func viewDidLoad() {
        for item in employeeData {
            let viewModel = EmployeeCell.ViewModel(name: item.employee, delegate: self)
            data.append(viewModel)
        }
    }
}

extension EmployeesPresenter: TabelDataProtocol {
    
    var numberOfRows: Int {
        return data.count
    }
    
    func getViewModel(for indexPath: IndexPath) -> CellViewModel {
        let item = data[indexPath.row]
        return item
    }
}

extension EmployeesPresenter: EmployeeCellDelegata {
    
    func deleteEmployee(_ index: Int) {
        let employee = employeeData[index]
        data.remove(at: index)
        employeeData.remove(at: index)
        let indexPath = IndexPath(row: index, section: 0)
        view?.deliteEmployeeViewController(indexPath: indexPath)
        
        if let id = departmentId {
            delegte?.deleteEmployee(employeeId: employee.id, departmentId: id)
        }
    }
}
