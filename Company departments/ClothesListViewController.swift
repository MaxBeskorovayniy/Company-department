//
//  ClothesListViewController.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 08.12.2022.
//

import UIKit

class ClothesListViewController: UIViewController {
    
    typealias Presenter = (ClothesListPresenterProtocol & MenuDataProtocol)
    
    let presenter: Presenter
    
    let tableView = UITableView()
    
    var destinationIndexPath: IndexPath?
    
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var barButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter.prepareData()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = barButtonItem
        
        tableView.snp.makeConstraints { constraint in
            constraint.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            constraint.left.equalToSuperview()
            constraint.right.equalToSuperview()
            constraint.bottom.equalToSuperview()
        }
        
        tableView.register(ClothesListCell.self, forCellReuseIdentifier: ClothesListCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        tableView.dragInteractionEnabled = true
    }
    
    @objc func didTapSaveButton() {
//        self.isEditing = true
//        presenter.didSelectClothes(indexPath: <#T##IndexPath#>)
//        navigationController?.popViewController(animated: true)
    }
}

extension ClothesListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDropDelegate, UITableViewDragDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.nameOfHeaderSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = presenter.getViewModel(for: indexPath)
        print()
        switch model {
        case let viewModel as ClothesListCell.ViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: ClothesListCell.className, for: indexPath) as! ClothesListCell
            return cell.fill(viewModel)
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionViewModel = presenter.getSectionViewModel(section: section)
        
        let sectionButton = UIButton()
        sectionButton.tag = section
        sectionButton.setTitle(sectionViewModel.header, for: .normal)
        sectionButton.addTarget(self, action: #selector(self.didTapSectionButton(sender:)), for: .touchUpInside)
        sectionButton.backgroundColor = .lightGray
        return sectionButton
    }
    
    @objc func didTapSectionButton(sender: UIButton) {
        let sectionIndex = sender.tag
        presenter.expandSection(section: sectionIndex)
//        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectClothes(indexPath: indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter.moveSection(fromIndex: sourceIndexPath, toIndex: destinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        guard let section = destinationIndexPath?.section else { return false }
        let sectinoModel = presenter.getSectionViewModel(section: section)
        return sectinoModel.expandable
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath

        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
            self.destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = presenter.getViewModel(for: indexPath)
        return [dragItem]
    }
}

extension ClothesListViewController: ClothesListViewProtocol {
    func reloadData(){
        tableView.reloadData()
    }
    
    func insert(rows: [IndexPath]) {
        tableView.performBatchUpdates {
            tableView.insertRows(at: rows, with: .fade)
        }
    }
    
    func delete(rows: [IndexPath]) {
        tableView.performBatchUpdates {
            tableView.deleteRows(at: rows, with: .fade)
        }
    }
}
