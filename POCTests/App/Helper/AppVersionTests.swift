//
//  AppVersionTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class AppVersionTests: XCTestCase {
	override func setUpWithError() throws {
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
	}
	
	func testGetAppVersionString() throws {
		XCTAssertEqual(AppVersion.getAppVersionString("Version: %@"), "Version: \(AppVersion.getVersion())")
	}
	
	func testGetAppVersionString_WhenPassNil_infoDictionary() throws {
		XCTAssertEqual(AppVersion.getAppVersionString("Version: %@", infoDictionary: nil), "", "The getAppVersionString() dont return empty when infoDictionary is nil")
	}
	
	func testGetAppVersionString_WhenPassNil_CFBundleShortVersionString() throws {
		let infoDictionary: [String: Any]? = ["CFBundleVersion": ""]
		XCTAssertEqual(AppVersion.getAppVersionString("Version: %@", infoDictionary: infoDictionary), "", "The getAppVersionString() dont return empty when item CFBundleShortVersionString does not exist")
	}
	
	func testGetAppVersionString_WhenPassNil_CFBundleVersion() throws {
		let infoDictionary: [String: Any]? = ["CFBundleShortVersionString": ""]
		XCTAssertEqual(AppVersion.getAppVersionString("Version: %@", infoDictionary: infoDictionary), "", "The getAppVersionString() dont return empty when item CFBundleVersion does not exist")
	}
	
	func testGetPlatform() throws {
		XCTAssertEqual(AppVersion.getPlatform(), "iOS")
	}
	
	func testGetVersion() throws {
		XCTAssertEqual(AppVersion.getVersion(), "1.0.0")
	}
	
	func testGetVersion_WhenPassNil_infoDictionary() {
		XCTAssertEqual(AppVersion.getVersion(infoDictionary: nil), "", "The getVersion() dont return empty when infoDictionary is nil")
	}
	
	func testGetVersion_WhenPassNil_CFBundleShortVersionString() {
		let infoDictionary: [String: Any]? = ["CFBundleVersion": ""]
		XCTAssertEqual(AppVersion.getVersion(infoDictionary: infoDictionary), "", "The getVersion() dont return empty when item CFBundleShortVersionString does not exist")
	}
}
