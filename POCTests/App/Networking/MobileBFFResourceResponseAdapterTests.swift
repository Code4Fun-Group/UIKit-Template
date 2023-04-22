//
//  MobileBFFResourceResponseAdapterTests.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC
import Networking

class MobileBFFResourceResponseAdapterTests: XCTestCase {
	
	override func setUpWithError() throws {
	}
	
	override func tearDownWithError() throws {
	}
	
	func testMobileBFFResourceResponseAdapter_WhenConvertDataToObjectSuccess() {
		
		let mobileBFFResource = MobileBFFResourceResponseAdapter(jsonHandler: JSONDataHandler())
		let jsonString = "{\"statusCode\":200, \"error\":\"Internal server error\", \"message\":[\"Success\"]}"
		mobileBFFResource.handle(errorData: Data(jsonString.utf8)) { result in
			XCTAssertNotNil(result?.status, "The result status return Nil when set jsondata correct")
		}
	}
	
	func testMobileBFFResourceResponseAdapter_WhenConvertDataToObjectFail() {
		let mobileBFFResource = MobileBFFResourceResponseAdapter(jsonHandler: JSONDataHandler())
		mobileBFFResource.handle(errorData: nil) { result in
			XCTAssertNil(result?.status, "The result status exist when set jsondata incorrect")
		}
	}
}
