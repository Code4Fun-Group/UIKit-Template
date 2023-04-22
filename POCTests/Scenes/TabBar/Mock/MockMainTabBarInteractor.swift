//
//  MockMainTabBarInteractor.swift
//  POCTests
//
//  Created by HieuMice on 30/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation
@testable import _DEV__POC

class MockMainTabBarInteractor: IMainTabBarInteractor {
	//Variables
	var selectTabBarItem: Int = 0
	var isForceReload: Bool = false
	
	//Functions
	func selectTabBarItem(request: SelectTabBarUseCase.Request) {
		selectTabBarItem = request.index
	}
	
	func getChildViewControllers(request: GetChildViewControllerUseCase.Request) {
		isForceReload = request.isForceReload
	}
}
