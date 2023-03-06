//
//  NasaImages_TestProjectTests.swift
//  NasaImages TestProjectTests
//
//  Created by TL-1 on 06/03/23.
//

import XCTest
import SnapshotTesting
@testable import NasaImages_TestProject

final class NasaImages_TestProjectTests: XCTestCase {

    func test_InitialViewControllerDefaultState() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        testApiCall()
        assertSnapshot(matching: vc, as: .image)
        
    }
    
    func testApiCall(){

        let expectations = expectation(description: "Valid response")
        // ACT
        APICallingManager.shared.getPictures({ pictures in

            // ASSERT
            XCTAssertNotNil(pictures)
            expectations.fulfill()

        })
        waitForExpectations(timeout: 5, handler: nil)

    }

}
