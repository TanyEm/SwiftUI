//
//  WoltRequestTests.swift
//  WoltTests
//
//  Created by Tatiana Podlesnykh on 8.1.2021.
//

import XCTest
@testable import Wolt

class WoltRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequest() throws {
        let restRequest = RestaurantListRequest()
        
        let expectation = self.expectation(description: "restaurantsList")

        var received = [RestaurantResponseData]()
        
        // location: 60.2, 24.7 (50)
        restRequest.getRestaurantsList(lat: 60.2, lon: 24.7) { (result) in
            if result.count != 0 {
                received = result
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertEqual(received.count, 50)
    }
}
