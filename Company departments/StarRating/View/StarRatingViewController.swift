//
//  StarRatingViewController.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.01.2023.
//

import UIKit
import Cosmos
import TinyConstraints

class StarRatingViewController: UIViewController {
    
    typealias Presenter = StarRatingPresenterProtocol
    
    let presenter: Presenter
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var dislikeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dislike", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(didTapDislikeButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var cosmosView: CosmosView = {
        let view = CosmosView()
        view.settings.filledImage = UIImage(named: "ic_selectedStar")
        view.settings.emptyImage = UIImage(named: "ic_unselectedStar")
        view.settings.starSize = 15
        view.settings.starMargin = 2
        view.settings.fillMode = .precise
        view.settings.updateOnTouch = false
        view.settings.textMargin = 10
        
       return view
    }()
    
    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(cosmosView)
        view.addSubview(likeButton)
        view.addSubview(dislikeButton)
        cosmosView.centerInSuperview()
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(dislikeButton.snp.top).offset(-20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        dislikeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
    @objc func didTapLikeButton() {
        presenter.rate(like: true)
    }
    
    @objc func didTapDislikeButton() {
        presenter.rate(like: false)
    }
}

extension StarRatingViewController: StarRatingViewProtocol {
    
    func updateRating(ratingStars: Double, ratingText: Double) {
        cosmosView.rating = ratingStars
        cosmosView.text = "\(ratingText)"
    }
}
