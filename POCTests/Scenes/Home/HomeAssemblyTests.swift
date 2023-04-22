//
//  HomeAssemblyTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class HomeAssemblyTests: XCTestCase {
	
	func testAssembly() {
		let assembly = HomeAssembly()
		
		let viewController = try? assembly.build(with: [:]) as? UINavigationController
		let rootViewController = viewController?.viewControllers.first as? HomeViewController
		
		XCTAssertEqual(assembly.module.name, "Home")
		XCTAssertNotNil(rootViewController, "viewController should not be nil")
		XCTAssertNotNil(rootViewController?.interactor, "interactor should not be nil")
		XCTAssertNotNil(rootViewController?.router, "router should not be nil")
	}
}
