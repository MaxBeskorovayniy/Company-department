//
//  ChooseClothesSelectedCell.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 08.12.2022.
//

import UIKit

class ChooseClothesSelectedCell: UITableViewCell {
    
    let titleLabel: UILabel = {
       let title = UILabel()
        title.font = .systemFont(ofSize: 25)
        title.textColor = .black
        return title
    }()
    
    let subTitleLabel: UILabel = {
       let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = .blue
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        
        titleLabel.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(5)
            constraint.bottom.equalToSuperview().offset(-5)
            constraint.left.equalToSuperview().offset(5)
            constraint.right.equalTo(subTitleLabel.snp.right).offset(-10)
        }
        
        subTitleLabel.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(5)
            constraint.bottom.equalToSuperview().offset(-5)
            constraint.right.equalToSuperview().offset(-15)
        }
    }
}

extension ChooseClothesSelectedCell {
    
    class ViewModel: CellViewModel {
        let title: String?
        let subTitle: String?
        
        init(title: String?, subTitle: String?) {
            self.title = title
            self.subTitle = subTitle
        }
    }
    
    func fill(_ model: ViewModel) -> UITableViewCell {
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        return self
    }
}
