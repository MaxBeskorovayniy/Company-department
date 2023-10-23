//
//  PetDocumentCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 21.07.2022.
//


import UIKit
import SnapKit
import AlamofireImage

class PetDocumentCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    
    //MARK: - Privates
    
    private func setupViews() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints({ constraint -> Void in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.left.equalToSuperview()
            constraint.right.equalToSuperview()
        })
    }
}

extension PetDocumentCell {
    
    class ViewModel: CellViewModel {
        var imageUrlString: String
        
        init(imageUrlString: String) {
            self.imageUrlString = imageUrlString
        }
    }
    
    func fill(_ model: ViewModel) -> UICollectionViewCell {
        if let url = URL(string: model.imageUrlString) {
            imageView.af.setImage(withURL: url)
        } else {
            print("No URL")
        }
        
        return self
    }
}
