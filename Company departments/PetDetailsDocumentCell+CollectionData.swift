//
//  PetDetailsDocumentCell+Data.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 21.07.2022.
//

import UIKit

extension PetDetailsDocumentCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = documents[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDocumentCell.className, for: indexPath) as! PetDocumentCell
        return cell.fill(model)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapItemAt(indexPath.row)
    }
}
