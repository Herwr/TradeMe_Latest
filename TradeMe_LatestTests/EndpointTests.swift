//
//  EndpointTests.swift
//  TradeMe_LatestTests
//
//  Created by Rich on 2/2/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import XCTest

class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiEndpoint_latestListings() {
        /*
         Test API Endpoint generation matches expected output, using:
         - example parameter
         */
        
        // setup
        let maxListings = 20

        let endpointUrl = EndPoint.latestListings(maxListings).url
        
        let endpointMatchString = "https://api.tmsandbox.co.nz/v1/listings/latest.json?rows=20"
        
        // test has an endpoint URL
        XCTAssertNotNil(endpointUrl)
        
        // test url string matches expected
        XCTAssertTrue(endpointUrl!.absoluteString == endpointMatchString)
    }

}
