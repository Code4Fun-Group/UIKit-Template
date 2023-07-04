//
//  MainTabBarInMemoryStore.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

protocol IMainTabBarInMemoryStore {
	var pages: [ITabBarPageModel] { get set }
	var selectedIndex: Int { get set }
	var isTabBarLoaded: Bool { get set }
}

class MainTabBarInMemoryStore: IMainTabBarInMemoryStore {
	var pages: [ITabBarPageModel] = []
	var selectedIndex: Int = 0
	var isTabBarLoaded: Bool = false
	
	init(selectedIndex: Int) {
		self.selectedIndex = selectedIndex
	}
}
