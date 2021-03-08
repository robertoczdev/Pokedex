//
//  pokedexUITests.swift
//  pokedexUITests
//
//  Created by admin on 2/18/21.
//

import XCTest

class pokedexUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
       continueAfterFailure = false

      app = XCUIApplication()
      app.launch()
    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    
    
    func testSearchAction(){
        app.searchBar.tap()
        app.searchBar.typeText("p")
        app.searchBar.typeText("i")
        app.searchBar.typeText("k")
        app.searchBar.typeText("a")
        app.searchBar.typeText("c")
        app.searchBar.typeText("h")
        app.searchBar.typeText("u")
        app.tables.staticTexts["#025"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["back"]/*[[".otherElements[\"bottomPopupView\"].buttons[\"back\"]",".buttons[\"back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.searchBar.buttons["Clear text"].tap()
        
        app.searchBar.typeText("c")
        app.searchBar.typeText("h")
        app.searchBar.typeText("a")
        app.searchBar.typeText("r")
        app.tables.staticTexts["charizard"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["back"]/*[[".otherElements[\"bottomPopupView\"].buttons[\"back\"]",".buttons[\"back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.searchBar.buttons["Clear text"].tap()
        
        app.searchBar.typeText("m")
        app.searchBar.typeText("e")
        app.searchBar.typeText("t")
        app.searchBar.typeText("a")
        app.searchBar.typeText("p")
        app.searchBar.typeText("o")
        app.searchBar.typeText("d")
        app.tables.staticTexts["metapod"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["back"]/*[[".otherElements[\"bottomPopupView\"].buttons[\"back\"]",".buttons[\"back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.searchBar.buttons["Clear text"].tap()

        
        
    }
    
    
    
}

private extension XCUIApplication{
    var searchBar: XCUIElement { self.otherElements["searchBar"]}
    
    
    
}
