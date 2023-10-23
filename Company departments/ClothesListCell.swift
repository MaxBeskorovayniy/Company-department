//
//  ClothesListCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 09.12.2022.
//

import UIKit

class ClothesListCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .blue
        return title
    }()
    
//    var clothesNameArray = [ClothesNameModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(5)
            constraint.bottom.equalToSuperview().offset(-5)
            constraint.left.equalToSuperview().offset(5)
            constraint.right.equalToSuperview()
        }
    }
}

extension ClothesListCell {
    
    class ViewModel: CellViewModel {
        
        let title: String?
        
        init(title: String?) {
            self.title = title
        }
    }
    
    func fill(_ model: ViewModel) -> UITableViewCell {
        titleLabel.text = model.title
        return self
    }
}
