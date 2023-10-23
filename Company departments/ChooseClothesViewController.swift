//
//  ChooseClothesViewController.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import UIKit

class ChooseClothesViewController: UIViewController {
    
    typealias Presenter = (ChooseClothesPresenterProtocol & TabelDataProtocol & ClothesListPresenterDelegate)
    
    let presenter: Presenter
    
    let tableView = UITableView()
    
    lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    
    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter.prepareData()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupViews() {
        navigationItem.rightBarButtonItem = addButton
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.snp.makeConstraints { constraint in
            constraint.top.equalTo(view.safeAreaLayoutGuide)
            constraint.left.equalToSuperview()
            constraint.right.equalToSuperview()
            constraint.bottom.equalToSuperview()
        }
        
        tableView.register(ChooseClothesDescriptionCell.self, forCellReuseIdentifier: ChooseClothesDescriptionCell.className)
        tableView.register(ChooseClothesSelectedCell.self, forCellReuseIdentifier: ChooseClothesSelectedCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func didTapAddButton() {
        navigationController?.pushViewController(ClothesListBuilder(delegate: presenter).build(), animated: true)
    }
}

extension ChooseClothesViewController: ChooseClothesViewProtocol {
    
    func showClothesList() {
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}


