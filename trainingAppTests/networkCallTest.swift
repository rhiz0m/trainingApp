//
//  trainingAppTests.swift
//  trainingAppTests
//
//  Created by Andreas Antonsson on 2023-10-06.
//

import XCTest
@testable import trainingApp

final class networkCallTest: XCTestCase {
    
    private var sut: SearchViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = SearchViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }
    
    func testNetworkCall() throws {
        
        let expectation = XCTestExpectation(description: "API request")
        
        let expectedMuscle = "biceps" // testing the network call
        
        sut.API(muscle: expectedMuscle)
        
        // Wait for the asynchronous task to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            // Check if the apiResponse has been updated
            XCTAssertFalse(self.sut.apiResponse.isEmpty)
            
            XCTAssertTrue(self.sut.apiResponse.allSatisfy { $0.muscle == expectedMuscle })
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        XCTAssertEqual(sut.apiResponse.count, 0, "Initially, expecting apiResponse to be empty")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0..<10 {
                sut.API(muscle: "hamstrings") // testing performance of making 10 API calls
            }
        }
    }
}
