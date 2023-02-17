//
//  TickerListViewModelTests.swift
//  MovieAppTests
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import XCTest
@testable import MovieApp

class TickerListViewModelTests: XCTestCase {
    
    func testGetTickers() {
        let mockTickerManager = MockTickerManager()
        let sut = TickerListViewModel(tickerManager: mockTickerManager)
        
        let tickers = Tickers(tickers: [Ticker(ticker: "", name: "", type: "", location: "")])
        mockTickerManager.tickers = tickers
        
        sut.getTickers()
        
        XCTAssertEqual(tickers.tickers, sut.tickers)
    }
    
    func testGetTickersFailed() {
        
        struct FailureError: Error, Equatable { let message: String }
        
        let mockTickerManager = MockTickerManager()
        let sut = TickerListViewModel(tickerManager: mockTickerManager)
        
        let error = FailureError(message: "Failed to get tickers")
        mockTickerManager.error = error
        
        sut.getTickers()
        
        XCTAssertEqual(sut.alertIsPresented, true)
    }
}
