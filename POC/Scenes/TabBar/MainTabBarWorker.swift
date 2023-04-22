//
//  MainTabBarWorker.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol IMainTabBarWorker {
	var selectedIndex: Int { get }
	var isTabBarLoaded: Bool { get }
	
	func saveSelected(at index: Int)
	func getAvailablePageViews(complete:  @escaping ([ITabBarPageModel]) -> Void)
}

class MainTabBarWorker {
	let homeAssembly: IHomeAssembly
	var inMemoryStore: IMainTabBarInMemoryStore
	
	init(homeAssembly: IHomeAssembly, inMemoryStore: IMainTabBarInMemoryStore) {
		self.homeAssembly = homeAssembly
		self.inMemoryStore = inMemoryStore
	}
}

extension MainTabBarWorker: IMainTabBarWorker {
	var selectedIndex: Int {
		inMemoryStore.selectedIndex
	}
	
	var isTabBarLoaded: Bool {
		inMemoryStore.isTabBarLoaded
	}
	
	func saveSelected(at index: Int) {
		inMemoryStore.selectedIndex = index
	}
	
	func getAvailablePageViews(complete: @escaping ([ITabBarPageModel]) -> Void) {
		inMemoryStore.pages.removeAll()
		if let homeViewController = try? homeAssembly.build(with: nil) {
			let page = TabBarPageModel(title: "Home.Title".localized, iconName: "tab-home", badge: nil, viewController: homeViewController)
			inMemoryStore.pages.append(page)
		}
		
		inMemoryStore.isTabBarLoaded = true
		complete(inMemoryStore.pages)
	}
}
