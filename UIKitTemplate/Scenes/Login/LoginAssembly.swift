//
//  LoginAssembly.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//

import Common

private enum Constants {
	static let moduleName = "Login"
	static let storyboardName = "Login"
	static let identifier = "LoginViewController"
}

public protocol ILoginAssembly: IAssembly {
}

public struct LoginAssembly: ILoginAssembly {
	public let module = Module(name: Constants.moduleName)
}

public extension LoginAssembly {
	func build(with parameters: [String: Any]?) throws -> UIViewController {
		let bundle = Bundle(for: LoginViewController.self)
		let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: bundle)
		guard let viewController = storyboard.instantiateViewController(withIdentifier: Constants.identifier) as? LoginViewController else {
			throw AssemblyError.moduleNotFound
		}
		
		let remoteStore = LoginRemoteStore()
		let worker = LoginWorker(remoteStore: remoteStore)
		let presenter = LoginPresenter(viewController: viewController)
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		let router = LoginRouter()
		viewController.interactor = interactor
		viewController.router = router
		
		return viewController
	}
}
