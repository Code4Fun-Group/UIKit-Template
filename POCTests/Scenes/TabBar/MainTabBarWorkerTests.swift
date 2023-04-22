//
//  MainTabBarWorkerTests.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class MainTabBarWorkerTests: XCTestCase {
	var homeAssembly: IHomeAssembly!
	var inMemoryStore: IMainTabBarInMemoryStore!
	var mainTabBarWorker: MainTabBarWorker!
	
	override func setUpWithError() throws {
		homeAssembly = MockHomeAssembly()
		inMemoryStore = MockMainTabBarInMemoryStore()
		mainTabBarWorker = MainTabBarWorker(homeAssembly: homeAssembly,
											inMemoryStore: inMemoryStore)
	}
	
	override func tearDownWithError() throws {
		homeAssembly = nil
		inMemoryStore = nil
		mainTabBarWorker = nil
	}
	
	func testMainTabbarWorker_ShowSelectedIndex_EqualZero() {
		XCTAssertEqual(mainTabBarWorker.selectedIndex, 0, "The selectedIndex does not return zero when default value is zero")
	}
	
	func testMainTabbarWorker_GetIsTabBarLoadedVariable_EqualFalse() {
		XCTAssertEqual(mainTabBarWorker.isTabBarLoaded, false, "The isTabBarLoaded does not return false when default value is false")
	}
	
	func testMainTabbarWorker_SaveSelectedIndex_EqualOne() {
		mainTabBarWorker.saveSelected(at: 1)
		
		XCTAssertEqual(mainTabBarWorker.selectedIndex, 1, "The selectedIndex does not return 1 when when update value equal to 1")
	}
	
	func testMainTabbarWorker_getAvailablePageViews_NumberPageEqualOne() {
		//Arrange
		let expectation = self.expectation(description: "Get Available list Page views expectation")
		
		//Act
		mainTabBarWorker.getAvailablePageViews { listPage in
			//Assert
			XCTAssertEqual(listPage.count, 1)
			XCTAssertNotNil(listPage)
			XCTAssertEqual(self.mainTabBarWorker.isTabBarLoaded, true, "The isTabBarLoaded does not return false when set value is true")
			expectation.fulfill()
		}
		self.wait(for: [expectation], timeout: 2)
	}
}
