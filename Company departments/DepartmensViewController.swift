//
//  ViewController.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 01.07.2022.
//

import UIKit

class DepartmensViewController: UIViewController {
        
    typealias Presenter = (DepartmentsViewOutput & TabelDataProtocol & CreateDepartmentPresenterDelegate)
    
    let presenter: Presenter
    
    let tableView = UITableView()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose your clothe", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(didTapChooseButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    
    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter.viewDidLoad()
        testArray()
        arraySort()
    }
    
    func setupViews() {
        navigationController?.setToolbarHidden(true, animated: true)
        navigationItem.rightBarButtonItem = addButton
        title = "Departmens list"
        view.backgroundColor = .white
        
        setupTabelView()
    }
    
    func setupTabelView() {
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(chooseButton)
        
        tableView.bottomAnchor.constraint(equalTo: chooseButton.topAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        chooseButton.snp.makeConstraints { constraint in
            constraint.left.equalToSuperview().offset(40)
            constraint.right.equalToSuperview().offset(-40)
            constraint.bottom.equalToSuperview().offset(-30)
            constraint.height.equalTo(45)
        }
        
//        tableView.register(PetDetailsDocumentCell.self, forCellReuseIdentifier: "PetDocumentCell")
        tableView.register(DepartmenCell.self, forCellReuseIdentifier: "DepartmensCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func didTapAddButton() {
        navigationController?.pushViewController(CreateDepartmentBuilder(delegate: presenter).build(), animated: true)
//        showPetAlert()
    }
    
    @objc func didTapChooseButton() {
        navigationController?.pushViewController(StarRatingBuilder().build(), animated: true)
    }
    
    func showPetAlert() {
        let alert = UIAlertController(title: "Pedigree", message: "Add your dog's pedigree not registered in our system", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = nil
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction) in
            print("Cancel")
        }))
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { _ in
            let text = alert.textFields?.first?.text
            print(text)
        })
        alert.addAction(addAction)
        
        if let textField = alert.textFields?.first {
            addAction.isEnabled = false
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: .main) { _ in
                let text = textField.text ?? ""
                addAction.isEnabled = !text.isEmpty
            }
        }
        present(alert, animated: true)
    }
}

extension DepartmensViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.getViewModel(for: indexPath)
        
        switch model {
        case let viewModel as DepartmenCell.ViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmensCell", for: indexPath) as! DepartmenCell
            return cell.fill(viewModel, index: indexPath.row)
//        case let viewModel as PetDetailsDocumentCell.ViewModel:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PetDocumentCell", for: indexPath) as! PetDetailsDocumentCell
////            cell.contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//            return cell.fill(viewModel)
            
        default: return UITableViewCell() }
    }
}

extension DepartmensViewController: DepartmensViewInput {
    func openDocumentPhoto() {
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
        print("Ok")
    }
    
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func openEmployeScreen(_ delegate: CreateEmployeePresenterDelegate, departmentId: UUID) {
        navigationController?.pushViewController(CreateEmployeeBuilder(delegate: delegate, departmentId: departmentId).build(), animated: true)
    }
    
    func showEmployee(employeesArray: [EmployeeModel], departmentId:UUID, delegete: EmployeesPresenterDelegete) {
        navigationController?.pushViewController(EmployeeBuilder(employeeArray: employeesArray, departmentId: departmentId, delegete: delegete).build(), animated: true)
    }
}

extension DepartmensViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(indexPath: indexPath)
        // call method from presenter, something like, didTap(indexPath)
    }
    
    func testArray() {
        var data = [-10, -5, -4, -8, -9, 1, 3, 9, 8, 7]
        var i = Int()
//        var number = 0
        let array = data.map { i in
            if i < 0 {
                let info = data.enumerated().filter({ $0.element == i }).first
                let index = info?.offset
                data.remove(at: index ?? 0)
                data.insert(0, at: index ?? 0)
                print(data)
            }
        }
        
        print(data.max())
        print(data.min())
    }
    
    enum AgeRange: CaseIterable  {
        case from18To22
        case from23To27
        case from28To35
        case from36To42
        case from43To50
        case from51To60
        case over60
        
        var title: String {
            switch self {
            case .from18To22: return "18-22"
            case .from23To27: return "23-27"
            case .from28To35: return "28-35"
            case .from36To42: return "36-42"
            case .from43To50: return "43-50"
            case .from51To60: return "51-60"
            case .over60: return "Over 60"
            }
        }
        
        var range: [Int] {
            switch self {
            case .from18To22: return Array(18...22)
            case .from23To27: return Array(23...27)
            case .from28To35: return Array(28...35)
            case .from36To42: return Array(36...42)
            case .from43To50: return Array(43...50)
            case .from51To60: return Array(51...60)
            case .over60: return Array(61...70)
            }
        }
        
        init?(title: String?) {
            self = AgeRange.allCases.first(where: { $0.title == title }) ?? .from18To22
        }
        
    }

    func arraySort() {
        var array = [Int]()
        
//        for ageRange in AgeRange.allCases {
//            for age in ageRange.range {
//                array.append(age)
//            }
//        }
//        print(array)
        
        var array1 = AgeRange.allCases.map({ $0.range}).flatMap({ $0 })
        
        print(array1)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

