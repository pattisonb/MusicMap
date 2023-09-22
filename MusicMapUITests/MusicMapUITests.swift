//
//  MusicMapUITests.swift
//  MusicMapUITests
//
//  Created by Brian Pattison on 9/20/23.
//

import XCTest

final class MusicMapUITests: XCTestCase {

    let app = XCUIApplication()
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testScrolling() {
        app.swipeUp()
        app.swipeUp()
    }
    
    func testVenuePhotoExists() {
        let venuePhoto = app.scrollViews.children(matching: .image).matching(identifier: "venuePhoto")
        XCTAssertNotNil(venuePhoto)
    }
    
    func testListSelectorVenues() {
        let venuesButton = app.buttons["venuesButton"]
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
        venuesButton.tap()
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
    }
    
    func testListSelectorArtsits() {
        let venuesButton = app.buttons["artistsButton"]
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
        venuesButton.tap()
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
    }
    
    
    func testArtistPhotoExists() {
        let artistPhoto = app.scrollViews.children(matching: .image).matching(identifier: "artistImage")
        XCTAssertNotNil(artistPhoto)
    }
    
    func testArtistNameExists() {
        let artistName = app.scrollViews.otherElements
        artistName.matching(identifier: "artistName")
        XCTAssertNotNil(artistName)
    }
    
    func testArtistGenreExists() {
        let artistGenre = app.scrollViews.otherElements
        artistGenre.matching(identifier: "artistGenre")
        XCTAssertNotNil(artistGenre)
    }
    
    func testGenreNameExists() {
        let genreName = app.scrollViews.otherElements
        genreName.matching(identifier: "genreName")
        XCTAssertNotNil(genreName)
    }
    
    func testArtistElementLink() {
        let artistLinkButton = app.buttons["artistLink"].firstMatch
        XCTAssertTrue(artistLinkButton.waitForExistence(timeout: 5), "Artist link button not found")
        artistLinkButton.tap()
        
        let artistHeaderImage = app.scrollViews.otherElements
        artistHeaderImage.matching(identifier: "artistHeaderImage")
        XCTAssertNotNil(artistHeaderImage)
        
        let venueDate = app.scrollViews.otherElements
        venueDate.matching(identifier: "venueDate")
        XCTAssertNotNil(venueDate)
    }
    
    func testVenueElementLink() {
        let venuesButton = app.buttons["venuesButton"]
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
        venuesButton.tap()
        XCTAssertTrue(venuesButton.waitForExistence(timeout: 2))
        let venueLinkButton = app.buttons["venueLink"].firstMatch
        XCTAssertTrue(venueLinkButton.waitForExistence(timeout: 5), "Venue link button not found")
        venueLinkButton.tap()
        
        let venueHeaderImage = app.scrollViews.otherElements
        venueHeaderImage.matching(identifier: "venueHeaderImage")
        XCTAssertNotNil(venueHeaderImage)
        
        let artistDate = app.scrollViews.otherElements
        artistDate.matching(identifier: "artistDate")
        XCTAssertNotNil(artistDate)
    }
}
