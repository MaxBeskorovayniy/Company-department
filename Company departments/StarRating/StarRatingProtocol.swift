//
//  StarRatingProtocol.swift
//  Company departments
//
//  Created by Максим Бескоровайный on 04.01.2023.
//

import Foundation

protocol StarRatingViewProtocol: AnyObject {
    func updateRating(ratingStars: Double, ratingText: Double)
}

protocol StarRatingPresenterProtocol {
    func rate(like: Bool)
}
