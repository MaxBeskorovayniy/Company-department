//
//  StarRatingPresenter.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.01.2023.
//

import Foundation

class StarRatingPresenter {
    
    weak var view: StarRatingViewProtocol?
    
    var likeData = [Int]()
    var dislikeData = [Int]()
}

extension StarRatingPresenter: StarRatingPresenterProtocol {
    
    func rate(like: Bool) {
        if like == true {
            likeData.append(1)
            print(likeData.count)
        } else {
            dislikeData.append(1)
            print(dislikeData.count)
        }
        
        let forRatingText = (100.0 * Double(likeData.count))/(Double(likeData.count) + Double(dislikeData.count))
        let forRatingStars = Double((forRatingText * 5) / 100)
        view?.updateRating(ratingStars: forRatingStars, ratingText: forRatingText)
    }
}
