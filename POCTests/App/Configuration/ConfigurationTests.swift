//
//  ConfigurationTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class ConfigurationTests: XCTestCase {
	
	override func setUpWithError() throws {
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
	}
	
	func testConfigureAPIKey() throws {
		XCTAssertEqual(ConfigurationProvider.default.apiKey, "12345")
	}
	
	func testConfigureAPIPaths() throws {
		XCTAssertEqual(ConfigurationProvider.default.apiPath, "https://dev.test.com/api/")
	}
}
