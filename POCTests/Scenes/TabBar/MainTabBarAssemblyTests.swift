//
//  MainTabBarAssemblyTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC
import Common

class MainTabBarAssemblyTests: XCTestCase {
	
	func testAssembly() {
		let homeAssembly = MockHomeAssembly()
		
		var assembly = MainTabBarAssembly(homeAssembly: homeAssembly)
		assembly.module = Module(name: "MainTabBar")
		
		let viewController = try? assembly.build(with: [:]) as? MainTabBarViewController
		
		XCTAssertEqual(assembly.module.name, "MainTabBar")
		XCTAssertNotNil(viewController, "viewController should not be nil")
		XCTAssertNotNil(viewController?.interactor, "interactor should not be nil")
		XCTAssertNotNil(viewController?.router, "router should not be nil")
	}
}
