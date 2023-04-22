//
//  MockTabBarRouter.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
import Common
@testable import _DEV__POC

class MockMainTabBarWorker: IMainTabBarWorker {
	var saveSelectedValueStub = 0
	
	var selectedIndex: Int {
		return saveSelectedValueStub
	}
	
	func saveSelected(at index: Int) {
		saveSelectedValueStub = index
	}
	
	var isTabBarLoaded: Bool = false
	var cachePageViews: [ITabBarPageModel] = []
	
	var getAvailablePageViewsCalles = 0
	var availablePageViewsStub: [ITabBarPageModel] = []
	func getAvailablePageViews(complete: @escaping ([ITabBarPageModel]) -> Void) {
		getAvailablePageViewsCalles += 0
		complete(availablePageViewsStub)
	}
}
