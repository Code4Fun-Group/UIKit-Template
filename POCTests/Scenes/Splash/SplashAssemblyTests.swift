//
//  SplashAssemblyTests.swift
//  POCTests
//
//  Created by Max Nguyen on 22/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC
import Common

class SplashAssemblyTests: XCTestCase {
	
	func testAssembly() {
		let securedStoreService = SecuredStoreService()
		let tokenService = TokenService(securedStoreService: securedStoreService)
		let assembly = SplashAssembly(tokenService: tokenService)
		
		let viewController = try? assembly.build(with: [:]) as? SplashViewController
		
		XCTAssertEqual(assembly.module.name, "Splash")
		XCTAssertNotNil(viewController, "viewController should not be nil")
		XCTAssertNotNil(viewController?.interactor, "interactor should not be nil")
		XCTAssertNotNil(viewController?.router, "router should not be nil")
	}
}
