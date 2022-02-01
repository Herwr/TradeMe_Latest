//
//  LatestListings.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import Foundation

struct LatestListings : Codable {
    var totalCount: Int
    var page: Int
    var pageSize: Int
    var list: [Listing]

    enum CodingKeys: String, CodingKey {
        case totalCount = "TotalCount"
        case page = "Page"
        case pageSize = "PageSize"
        case list = "List"
    }
}

/*  JSON data format
 {
     "TotalCount": 250,
     "Page": 1,
     "PageSize": 50,
     "List": [Listing]
 */

extension LatestListings {
    static var testData: LatestListings {
        return LatestListings(totalCount: 1, page: 1, pageSize: 1, list: Listing.testData)
    }
}
