//
//  Endpoint.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import Foundation

enum EndPoint {
    case latestListings(Int)

    private static let baseUrl = URL(string: "https://api.tmsandbox.co.nz/v1/")!
            
    var url: URL? {
        switch self {
        case .latestListings(let rows):
            let endpointUrl = EndPoint.baseUrl.appendingPathComponent("listings/latest.json")
            var urlComponents = URLComponents(url: endpointUrl, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = [URLQueryItem(name: "rows", value: String(rows))]

            return urlComponents?.url
        }
    }
}
