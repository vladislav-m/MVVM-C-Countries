//
//  CountriesUITests.swift
//  CountriesUITests
//
//  Created by Vladislav Myakotin on 14/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import XCTest

class CountriesUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {

    }

    func test_application_did_load_countries_list_on_launch() {
        XCTAssert(XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Afghanistan"]/*[[".cells.staticTexts[\"Afghanistan\"]",".staticTexts[\"Afghanistan\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.waitForExistence(timeout: 1.0),
                  "Unable to find cell for Afganistan country. Countries list was not loaded or displayed")
        XCTAssert(XCUIApplication().tables.cells.count >= 1, "Loaded countries count is less than two")
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Afghanistan"]/*[[".cells.staticTexts[\"Afghanistan\"]",".staticTexts[\"Afghanistan\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(XCUIApplication().staticTexts["Kabul"].waitForExistence(timeout: 1.0),
                  "Unable to find label Kabul. Afganistan country info was not fetched or displayed properly")
        XCTAssert(XCUIApplication().staticTexts["IRN, PAK, TKM, UZB, TJK, CHN"].exists,
                  "Unable to find label with Afganistan neighbours")
        XCTAssert(XCUIApplication().staticTexts["Afghan afghani"].exists,
                  "Unable to find label with Afganistan currency")
    }

}
