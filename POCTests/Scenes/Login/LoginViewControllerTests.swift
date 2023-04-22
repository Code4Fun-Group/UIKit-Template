//
//  LoginViewControllerTests.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class LoginViewControllerTests: XCTestCase {
	var loginViewcontroller: LoginViewController!
	
	override func setUpWithError() throws {
		loginViewcontroller = LoginViewController()
	}
	
	override func tearDownWithError() throws {
		loginViewcontroller = nil
	}
	
	func testLoginViewcontroller_WhenEntryToViewController_ReturnTrue() {
		
	}
}
