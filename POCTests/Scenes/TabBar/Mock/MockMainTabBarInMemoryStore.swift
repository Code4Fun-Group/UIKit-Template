//
//  MockMainTabBarInMemoryStore.swift
//  POCTests
//
//  Created by HieuMice on 29/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation
@testable import _DEV__POC

class MockMainTabBarInMemoryStore: IMainTabBarInMemoryStore {
	var pages: [ITabBarPageModel] = [TabBarPageModel(title: "Login Screen", iconName: "login_icon", viewController: LoginViewController())]
	
	var selectedIndex: Int = 0
	
	var isTabBarLoaded: Bool = false
}
