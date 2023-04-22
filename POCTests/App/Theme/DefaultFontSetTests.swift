//
//  DefaultFontSetTests.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
import Common
@testable import _DEV__POC

class DefaultFontSetTests: XCTestCase {
	var sut: DefaultFontSet!
	
	override func setUpWithError() throws {
		sut = DefaultFontSet()
	}
	
	override func tearDownWithError() throws {
		sut = nil
	}
	
	func testDefaultFontSet_getFontSizeIsSystemWithTenSize() {
		//Assert
		XCTAssertEqual(UIFont.systemFont(ofSize: 10), sut.font(style: .body1), "The font(style) is not return UIFont.systemFont(ofSize: 10) when call func set font")
	}
}
