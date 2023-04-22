//
//  XCTestCase+Stub.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

// swiftlint:disable force_unwrapping

import XCTest
import OHHTTPStubs

extension XCTestCase {
	func stubJsonRequest(path: String, status: Int, jsonFileName: String?) {
		stub(condition: isPath(path)) { _ in
			let url = Bundle(for: type(of: self)).url(forResource: jsonFileName, withExtension: "json")!
			return HTTPStubsResponse(fileURL: url, statusCode: Int32(status), headers: ["Content-Type": "application/json"])
		}
	}
}
