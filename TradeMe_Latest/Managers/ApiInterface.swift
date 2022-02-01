//
//  ApiInterface.swift
//  TradeMe_Categories
//
//  Created by Rich on 1/28/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import Combine

protocol ApiInterface {
    func fetchLatestListings() -> AnyPublisher<LatestListings, Error>
}
