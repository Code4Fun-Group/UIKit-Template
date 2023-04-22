//
//  SplashAssembly.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import Networking

private enum Constants {
	static let moduleName = "Splash"
	static let storyboardName = "Splash"
	static let identifier = "SplashViewController"
}

public protocol ISplashAssembly: IAssembly {
}

public struct SplashAssembly: ISplashAssembly {
	public let tokenService: ITokenService
	
	public let module = Module(name: Constants.moduleName)
}

public extension SplashAssembly {
	func build(with parameters: [String: Any]?) throws -> UIViewController {
		let bundle = Bundle(for: SplashViewController.self)
		let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: bundle)
		guard let viewController = storyboard.instantiateViewController(withIdentifier: Constants.identifier) as? SplashViewController else {
			throw AssemblyError.moduleNotFound
		}
		
		let worker = SplashWorker(tokenService: tokenService)
		let presenter = SplashPresenter(viewController: viewController)
		let interactor = SplashInteractor(worker: worker, presenter: presenter)
		let router = SplashRouter()
		viewController.interactor = interactor
		viewController.router = router
		
		return viewController
	}
}
