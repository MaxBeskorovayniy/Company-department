//
//  PetDetailsDocumentsCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 21.07.2022.
//

import SnapKit
import UIKit

protocol PetDetailsDocumentCellDelegate: AnyObject {
    func didTapItemAt(_ index: Int)
}

class PetDetailsDocumentCell: UITableViewCell {

    weak var delegate: PetDetailsDocumentCellDelegate?
    
    var documents = [PetDocumentCell.ViewModel]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 75, height: 80)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: - Privates
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints({ constraint -> Void in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.left.equalToSuperview().offset(20)
            constraint.right.equalToSuperview().offset(-20)
            constraint.height.equalTo(80)
        })
        
        collectionView.register(PetDocumentCell.self, forCellWithReuseIdentifier: PetDocumentCell.className)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension PetDetailsDocumentCell {
    
    class ViewModel: CellViewModel {
        let delegate: PetDetailsDocumentCellDelegate
        let documents: [PetDocumentCell.ViewModel]
        
        init(delegate: PetDetailsDocumentCellDelegate, documents: [PetDocumentCell.ViewModel]) {
            self.delegate = delegate
            self.documents = documents
        }
    }
    
    func fill(_ model: ViewModel) -> UITableViewCell {
        delegate = model.delegate
        documents = model.documents
        return self
    }
}


