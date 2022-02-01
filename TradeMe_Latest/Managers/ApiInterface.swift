//
//  ApiInterface.swift
//  TradeMe_Categories
//
//  Created by Rich on 1/28/22.
//

import Combine

protocol ApiInterface {
    func fetchLatestListings() -> AnyPublisher<LatestListings, Error>
}
