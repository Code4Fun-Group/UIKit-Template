//
//  MainTabBarAssembly.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common

private enum Constants {
	static let moduleName = "MainTabBar"
	static let storyboardName = "MainTabBar"
	static let identifier = "MainTabBarViewController"
}

public protocol IMainTabBarAssembly: IAssembly {
}

public struct MainTabBarAssembly: IMainTabBarAssembly {
	public let homeAssembly: IHomeAssembly
	
	public var module = Module(name: Constants.moduleName)
}

public extension MainTabBarAssembly {
	func build(with parameters: [String: Any]?) throws -> UIViewController {
		let viewController = MainTabBarViewController()
		let indexItem = parameters?["tabbarItem"] as? Int
		
		let inMemoryStore = MainTabBarInMemoryStore(selectedIndex: indexItem ?? 0)
		let worker = MainTabBarWorker(homeAssembly: homeAssembly, inMemoryStore: inMemoryStore)
		
		let presenter = MainTabBarPresenter(viewController: viewController)
		let interactor = MainTabBarInteractor(worker: worker, presenter: presenter)
		let router = MainTabBarRouter()
		viewController.interactor = interactor
		viewController.router = router
		
		return viewController
	}
}
