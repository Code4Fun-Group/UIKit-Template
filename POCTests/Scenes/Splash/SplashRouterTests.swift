//
//  SplashRouterTests.swift
//  POCTests
//
//  Created by Max Nguyen on 22/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class SplashRouterTests: XCTestCase {
	var router: SplashRouter!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		router = SplashRouter()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
	}
	
	func testGoToLogin() throws {
		router.goToLogin()
		
		let window = UIApplication.shared.windows.first
		let	viewController = window?.rootViewController
		
		XCTAssertNotNil(viewController as? LoginViewController)
	}
	
	func testGoToHomePage() throws {
		router.goToHomePage()
		
		let window = UIApplication.shared.windows.first
		let	viewController = window?.rootViewController
		
		XCTAssertNotNil(viewController as? MainTabBarViewController)
	}
}
