//
//  EmploeeCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 12.07.2022.
//

import Foundation
import UIKit

protocol EmployeeCellDelegata: AnyObject{
    func deleteEmployee(_ index: Int)
}

class EmployeeCell: UITableViewCell {
    
    private var delegate: EmployeeCellDelegata?
    
    private var employeeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapDeleteButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupEmployeeLabel()
        setupDeleteButton ()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupEmployeeLabel() {
        contentView.addSubview(employeeLabel)
        
        employeeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        employeeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        employeeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    }
    
    private func setupDeleteButton() {
        contentView.addSubview(deleteButton)
        
        deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: employeeLabel.trailingAnchor, constant: 10).isActive = true
    }
    
    @objc private  func tapDeleteButton() {
        delegate?.deleteEmployee(tag)
    }
}

extension EmployeeCell {
    
    class ViewModel: CellViewModel {
        let titleText: String
        let delegate: EmployeeCellDelegata
        
        init(name: String, delegate: EmployeeCellDelegata) {
            self.titleText = name
            self.delegate = delegate
        }
    }
    
    func fill(_ model: ViewModel, _ index: Int) -> UITableViewCell {
        tag = index
        employeeLabel.text = model.titleText
        delegate = model.delegate
        return self
    }
}
