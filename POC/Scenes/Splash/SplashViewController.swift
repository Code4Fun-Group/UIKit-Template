//
//  SplashViewController.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
	// MARK: - Outlets
	
	// MARK: - Variables
	var interactor: ISplashInteractor!
	var router: ISplashRouter!
	
	// MARK: Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		checkAuthen()
	}
}

// MARK: - Setup UI
private extension SplashViewController {
}

// MARK: - Actions
private extension SplashViewController {}

// MARK: - Interactor
private extension SplashViewController {
	func checkAuthen() {
		let request = CheckAuthenticationUseCase.Request()
		interactor.checkAuthen(request: request)
	}
}

// MARK: - ISplashViewController
extension SplashViewController: ISplashViewController {
	func showAuthen(viewModel: CheckAuthenticationUseCase.ViewModel) {
//		if viewModel.accessToken == nil {
//			router.goToLogin()
//		} else {
			router.goToHomePage()
//		}
	}
}
