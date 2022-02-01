//
//  ListingsViewModelTests.swift
//  TradeMe_LatestTests
//
//  Created by Rich on 2/2/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import XCTest
import Combine
@testable import TradeMe_Latest

class ListingsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchLatestListings_populatesListings() {
        /*
         Test fetchLatestListings() populates listings array
         */
        
        // setup
        let apiManager = ApiManagerMock()
        let viewModel = ListingsViewModel(apiManager: apiManager)
        
        // action
        viewModel.fetchLatest()
        
        // test has listings
        // ToDo
        
        // test number of listings
        // ToDo

        // test expected test data values
        // ToDo
        
    }
}

struct ApiManagerMock : ApiInterface {
    func fetchLatestListings() -> AnyPublisher<LatestListings, Error> {
        Future { promise in
            print(LatestListings.testData)
            promise(.success(LatestListings.testData))
        }
        .eraseToAnyPublisher()
    }
}
