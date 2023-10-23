//
//  EmployeeVC.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 06.07.2022.
//

import Foundation
import UIKit

class CreateEmployeeViewConntroller: UIViewController {
    
    typealias Presenter = CreateEmployeeViewConntrollerOutput

    var presenter: Presenter
    
    let textField = UITextField()
    
    lazy var addEmployeeButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapAddEmploeeButton), for: .touchUpInside)
        button.setTitle("Add employee", for: .normal)
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
        navigationController?.setToolbarHidden(false, animated: true)
        title = "Add new employee"
        view.backgroundColor = .white
        
        setupTextField()
        setupAddEmployeeButton()
    }
    
    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter new employee"
        textField.textAlignment = .center
        textField.textColor = .gray
        textField.borderStyle = .roundedRect
        
        view.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupAddEmployeeButton() {
        addEmployeeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(addEmployeeButton)
        
        addEmployeeButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        addEmployeeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEmployeeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    @objc func didTapAddEmploeeButton() {
        presenter.createEmploeeButton(text: textField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}

extension CreateEmployeeViewConntroller: CreateEmployeeViewInput {
}
