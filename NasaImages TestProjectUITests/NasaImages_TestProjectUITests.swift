//
//  NasaImages_TestProjectUITests.swift
//  NasaImages TestProjectUITests
//
//  Created by TL-1 on 06/03/23.
//

import XCTest

final class NasaImages_TestProjectUITests: XCTestCase {

    override func setUpWithError() throws {
     
        continueAfterFailure = false

    }

   
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func testAppFlow(){
        // if we didnt get api response in 10 second case will fail
        DispatchQueue.main.asyncAfter(deadline: .now() + 10 , execute: { // waiting for api call
            let app = XCUIApplication()
            
            let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
            element.children(matching: .other).element(boundBy: 0).collectionViews.cells.otherElements.containing(.staticText, identifier:"iPhone 9").element.tap()
            
            let icBackButton = app.buttons["ic back"]
            icBackButton.tap()
            
            let cellsQuery = app.collectionViews.cells
            cellsQuery.otherElements.containing(.staticText, identifier:"MacBook Pro").element.swipeUp()
            element.children(matching: .other).element.children(matching: .collectionView).element.swipeDown()
            cellsQuery.otherElements.containing(.staticText, identifier:"iPhone X").element.tap()
            icBackButton.tap()
        })
        
        
    }
    func testAppFailedFlow(){
        // not waiting for api call so this case will always fail
            let app = XCUIApplication()
            let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
            element.children(matching: .other).element(boundBy: 0).collectionViews.cells.otherElements.containing(.staticText, identifier:"iPhone 9").element.tap()
            
            let icBackButton = app.buttons["ic back"]
            icBackButton.tap()
            
            let cellsQuery = app.collectionViews.cells
            cellsQuery.otherElements.containing(.staticText, identifier:"MacBook Pro").element.swipeUp()
            element.children(matching: .other).element.children(matching: .collectionView).element.swipeDown()
            cellsQuery.otherElements.containing(.staticText, identifier:"iPhone X").element.tap()
            icBackButton.tap()
       
    }
}
