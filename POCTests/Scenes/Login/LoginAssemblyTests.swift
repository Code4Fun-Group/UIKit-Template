//
//  LoginAssemblyTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class LoginAssemblyTests: XCTestCase {
	
	func testAssembly() {
		let assembly = LoginAssembly()
		
		let viewController = try? assembly.build(with: [:]) as? LoginViewController
		
		XCTAssertEqual(assembly.module.name, "Login")
		XCTAssertNotNil(viewController, "viewController should not be nil")
		XCTAssertNotNil(viewController?.interactor, "interactor should not be nil")
		XCTAssertNotNil(viewController?.router, "router should not be nil")
	}
}
