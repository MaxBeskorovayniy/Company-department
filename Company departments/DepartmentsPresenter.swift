//
//  Presenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//

import Foundation

class DepartmentsPresenter {
    
    weak var view: DepartmensViewInput?
    var data = [CellViewModel]()
    
    func fillData() {
        view?.reloadData()
    }
}

extension DepartmentsPresenter: DepartmentsViewOutput {
    func viewDidLoad() {
//        fillData()
        data.append(PetDetailsDocumentCell.ViewModel(delegate: self, documents: [PetDocumentCell.ViewModel(imageUrlString: "https://html5css.ru/css/img_forest.jpg"), PetDocumentCell.ViewModel(imageUrlString: "https://html5css.ru/css/img_forest.jpg"), PetDocumentCell.ViewModel(imageUrlString: "https://html5css.ru/css/img_forest.jpg"), PetDocumentCell.ViewModel(imageUrlString: "https://html5css.ru/css/img_forest.jpg"), PetDocumentCell.ViewModel(imageUrlString: "https://html5css.ru/css/img_forest.jpg")]))
    }
    
    func didSelect(indexPath: IndexPath) {
        guard let item = data[indexPath.row] as? DepartmenCell.ViewModel else { return }
        view?.showEmployee(employeesArray: item.arrayEmployee, departmentId: item.id, delegete: self)
    }
    // get view model from array
    // put employees array in view methid, like showEmployees(employeesarray)
}

extension DepartmentsPresenter: TabelDataProtocol {
    
    var numberOfRows: Int {
        return data.count
    }
    
    func getViewModel(for indexPath: IndexPath) -> CellViewModel {
        let item = data[indexPath.row]
        return item
    }
}

extension DepartmentsPresenter: CreateDepartmentPresenterDelegate {
    
    func didCreateDepartment(_ department: DepartmentModel) {
        data.append(DepartmenCell.ViewModel(titleText: department.name, delegate: self, id: department.id))
        view?.reloadData()
    }
}

extension DepartmentsPresenter: DepartmenCellDelegate {
    
    func didOpenCreateEmployeeViewController(_ index: Int) {
//        let viewModel = data[index]
        guard let viewModel = data[index] as? DepartmenCell.ViewModel else { return }
//                viewModel.id
        // нужно понять на какой департмент кнопку нажали
        // достать вью модельку и взять айди
        // передать айди департамента дальше на скрин презентера
        view?.openEmployeScreen(self, departmentId: viewModel.id)
    }
    
    func didDeleteDepartment(_ index: Int) {
        data.remove(at: index)
        view?.reloadData()
    }
}

extension DepartmentsPresenter: CreateEmployeePresenterDelegate {
    
    func didCreateEmployee(_ employee: EmployeeModel, departmentId: UUID) {
        // по айди департамента будем искать вью модель депаратамента
        guard let viewModel = data.first(where: { ($0 as? DepartmenCell.ViewModel)?.id == departmentId }) as? DepartmenCell.ViewModel else { return }
        
        viewModel.arrayEmployee.append(employee)
        view?.reloadData()
    }
}

extension DepartmentsPresenter: EmployeesPresenterDelegete {
    
    func deleteEmployee(employeeId: UUID, departmentId: UUID) {
        guard let viewModel = data.first(where: { ($0 as? DepartmenCell.ViewModel)?.id == departmentId }) as? DepartmenCell.ViewModel else { return }
        
        guard let employeeIndex = viewModel.arrayEmployee.firstIndex(where: { $0.id == employeeId }) else { return }
        viewModel.arrayEmployee.remove(at: employeeIndex)
        view?.reloadData()
    }
}

extension DepartmentsPresenter: PetDetailsDocumentCellDelegate {
    
    func didTapItemAt(_ index: Int) {
        view?.openDocumentPhoto()
    }
}
