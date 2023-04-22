//
//  TokenServiceTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
import Common
@testable import _DEV__POC

class TokenServiceTests: XCTestCase {
	var tokenService: TokenService!
	var securedStoreService: SecuredStoreService!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		securedStoreService = SecuredStoreService()
		securedStoreService.set(value: "Thisisaccesstoken", key: "accessToken")
		securedStoreService.set(value: "Thisisuid", key: "uid")
		tokenService = TokenService(securedStoreService: securedStoreService)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		securedStoreService.remove(key: "accessToken")
		securedStoreService.remove(key: "uid")
		securedStoreService = nil
		tokenService = nil
		
	}
	
	func testClearToken() throws {
		tokenService.clearToken()
		
		XCTAssertNil(tokenService.uid)
		XCTAssertNil(tokenService.accessToken)
	}
	
	func testSaveAccessToken() throws {
		tokenService.accessToken = "Thisisnewaccesstoken"
		
		XCTAssertEqual(tokenService.accessToken, "Thisisnewaccesstoken")
	}
	
	func testSaveUID() throws {
		tokenService.uid = "Thisisnewuid"
		
		XCTAssertEqual(tokenService.uid, "Thisisnewuid")
	}
}
