//
//  Cell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.07.2022.
//


import UIKit

protocol DepartmenCellDelegate: AnyObject {
    func didOpenCreateEmployeeViewController(_ index: Int)
    func didDeleteDepartment(_ index: Int)
}

class DepartmenCell: UITableViewCell {
    
    var delegate: DepartmenCellDelegate?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var addEmployeeButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.addTarget(self, action: #selector(didTapAddEmployeeButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var countEmployeeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var deleteDepartmentButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupLabel()
        setupCountEmployeeLabel()
        setupAddEmployeeButton()
        setupDeleteDepartmentButton()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    }
    
    func setupAddEmployeeButton() {
        contentView.addSubview(addEmployeeButton)
        
        addEmployeeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        addEmployeeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        addEmployeeButton.leadingAnchor.constraint(equalTo: countEmployeeLabel.trailingAnchor, constant: 10).isActive = true
    }
    
    func setupCountEmployeeLabel() {
        contentView.addSubview(countEmployeeLabel)
        
        countEmployeeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        countEmployeeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        countEmployeeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
    }
    
    func setupDeleteDepartmentButton() {
        contentView.addSubview(deleteDepartmentButton)
        
        deleteDepartmentButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        deleteDepartmentButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        deleteDepartmentButton.leadingAnchor.constraint(equalTo: addEmployeeButton.trailingAnchor, constant: 10).isActive = true
        deleteDepartmentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
    }
    
    @objc func didTapAddEmployeeButton() {
        delegate?.didOpenCreateEmployeeViewController(tag)
    }
    
    @objc func didTapDeleteButton() {
        delegate?.didDeleteDepartment(tag)
    }
}

extension DepartmenCell {
    
    class ViewModel: CellViewModel {
        let titleText: String
        let delegate: DepartmenCellDelegate
        var arrayEmployee = [EmployeeModel]()
        var id: UUID
        
        init(titleText: String, delegate: DepartmenCellDelegate, id: UUID) {
            self.titleText = titleText
            self.delegate = delegate
            self.id = id
        }
    }
    
    func fill(_ model: ViewModel, index: Int) -> UITableViewCell {
        tag = index
        titleLabel.text = model.titleText
        delegate = model.delegate
        countEmployeeLabel.text = String(model.arrayEmployee.count)
        return self
    }
}


