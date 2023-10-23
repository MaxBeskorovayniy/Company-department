//
//  DidTapAddButton.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 01.07.2022.
//

import UIKit

class CreateDeprtmentViewController: UIViewController {
    
    typealias Presenter = CreateDepartmentOutput
    
    let presenter: Presenter
    
    let textField = UITextField()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(addNewDepartment), for: .touchUpInside)
        button.setTitle("Add Department", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()

    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Add new department"
        view.backgroundColor = .white
        
        setupTextField()
        setupAddButton()
    }
    
    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter new department"
        textField.textColor = .gray
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        
        self.view.addSubview(textField)
       
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupAddButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(createButton)
        
        createButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func addNewDepartment() {
        presenter.didTapCreateButton(text: textField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}

extension CreateDeprtmentViewController: CreateDepartmentInput {
}

