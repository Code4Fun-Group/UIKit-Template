//
//  HomeAssembly.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common

private enum Constants {
	static let moduleName = "Home"
	static let storyboardName = "Home"
	static let identifier = "HomeViewController"
}

public protocol IHomeAssembly: IAssembly {
}

public struct HomeAssembly: IHomeAssembly {
	public let module = Module(name: Constants.moduleName)
}

public extension HomeAssembly {
	func build(with parameters: [String: Any]?) throws -> UIViewController {
		let bundle = Bundle(for: HomeViewController.self)
		let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: bundle)
		guard let viewController = storyboard.instantiateViewController(withIdentifier: Constants.identifier) as? HomeViewController else {
			throw AssemblyError.moduleNotFound
		}
		
		let remoteStore = HomeRemoteStore()
		let worker = HomeWorker(remoteStore: remoteStore)
		let presenter = HomePresenter(viewController: viewController)
		let interactor = HomeInteractor(worker: worker, presenter: presenter)
		let router = HomeRouter()
		viewController.interactor = interactor
		viewController.router = router
		
		return UINavigationController(rootViewController: viewController)
	}
}
