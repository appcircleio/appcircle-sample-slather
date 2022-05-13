//
//  AppcircleUITests.swift
//  AppcircleUITests
//
//  Created by Mustafa on 29.12.2021.
//

import XCTest

extension XCUIElement {

    func clearAndEnterText(_ text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = stringValue.map { _ in "\u{8}" }.joined(separator: "")

        self.typeText(deleteString)
        self.typeText(text)
    }

}

class AppcircleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = XCUIApplication().tables
        let numberCell = tablesQuery.textFields["Enter a number"]
        let resultText = tablesQuery.staticTexts.element(boundBy: 1)

        numberCell.tap()
        numberCell.typeText("3")
        XCTAssertEqual(resultText.label,"Fizz")
        
        numberCell.tap()
        numberCell.clearAndEnterText("15")
        XCTAssertEqual(resultText.label,"FizzBuzz")
        
        numberCell.tap()
        numberCell.clearAndEnterText("4")
        XCTAssertEqual(resultText.label,"4")

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
