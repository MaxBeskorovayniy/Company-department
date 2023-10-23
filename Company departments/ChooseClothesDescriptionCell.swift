//
//  ChooseClothesDescriptionCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 07.12.2022.
//

import UIKit

class ChooseClothesDescriptionCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .lightGray
        
        titleLabel.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.centerX.equalTo(contentView.snp.centerX)
        }
    }
}

extension ChooseClothesDescriptionCell {
    
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
