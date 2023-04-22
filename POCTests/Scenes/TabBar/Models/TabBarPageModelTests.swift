//
//  TabBarPageModelTests.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class TabBarPageModelTests: XCTestCase {
	func testTabBarPageModel_getIconActiveName_ReturnStringWithActiveCharacter() {
		let tabbarPageModel = TabBarPageModel(title: "Login Screen", iconName: "login_icon", viewController: LoginViewController())
		XCTAssertEqual(tabbarPageModel.iconActiveName, "login_icon-active", "The iconActiveName does not return  value is login_icon-active")
	}
}
