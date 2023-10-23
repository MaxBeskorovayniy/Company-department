//
//  EmployeeViewController.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.07.2022.
//

import Foundation
import UIKit

class EmployeesViewController: UIViewController {
    
    typealias Presenter = (EmployeesViewControllerOutput & TabelDataProtocol & EmployeeCellDelegata)
    
    let presenter: Presenter
    
    let tabelView = UITableView()
    
    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employees list"
        view.backgroundColor = .white
        
        setapTabelView()
        presenter.viewDidLoad()
    }
    
    func setapTabelView() {
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tabelView)
        
        tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tabelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tabelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        
        tabelView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell")
        
        tabelView.dataSource = self
//        tabelView.delegate = self
    }
}

extension EmployeesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.getViewModel(for: indexPath)
        
        switch model {
        case let viewModel as EmployeeCell.ViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell
            return cell.fill(viewModel, indexPath.row)
            default: return UITableViewCell() }
    }
}

extension EmployeesViewController: EmployeesViewControllerInput {
    
    func deliteEmployeeViewController(indexPath: IndexPath) {
        tabelView.deleteRows(at: [indexPath], with: .left)
        navigationController?.popViewController(animated: true)
    }
}
