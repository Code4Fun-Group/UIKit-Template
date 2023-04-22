//
//  MockHomeAssembly.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
import Common
@testable import _DEV__POC

class MockHomeAssembly: IHomeAssembly {
	func build(with parameters: [String: Any]? ) throws -> UIViewController {
		return UIViewController()
	}
	
	let module: Module = Module(name: "mockhome")
}
