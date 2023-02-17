//
//  TickerDetailsViewModelTests.swift
//  MovieAppTests
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import XCTest
@testable import MovieApp

class TickerDetailsViewModelTests: XCTestCase {
    
    func testGetTickerDetails() {
        let mockTickerManager = MockTickerManager()
        let sut = TickerDetailsViewModel(ticker: "A", tickerManager: mockTickerManager)
        
        let tickerDetails = TickerDetails(name: "", employees: 0, icon: nil, websiteURL: URL(fileURLWithPath: ""))
        mockTickerManager.tickerDetails = tickerDetails
        
        sut.getTickerDetails()
        
        XCTAssertEqual(tickerDetails, sut.ticker)
    }
    
    func testGetTickerDetailsFailed() {
        
        struct FailureError: Error, Equatable { let message: String }
        
        let mockTickerManager = MockTickerManager()
        let sut = TickerDetailsViewModel(ticker: "A", tickerManager: mockTickerManager)
        
        let error = FailureError(message: "Failed to get ticker details")
        mockTickerManager.error = error
        
        sut.getTickerDetails()
        
        XCTAssertEqual(sut.alertIsPresented, true)
    }
}
